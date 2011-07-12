package com.unef.domain.business.route
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.business.institutions.Institution;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.INavigatorContent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.utils.ObjectUtil;
	
	public class RouteController extends BaseController
	{
		private var _service:RouteService;
		private var route:Route;
		
		public function RouteController(view:IView)
		{
			super(view);
		}
		
		override public function initializeListeners(event:FlexEvent):void
		{
			super.initializeListeners(event);
			addEventListener(FlexEvent.CREATION_COMPLETE,findAll);
			service.addEventListener(BaseEvent.REGISTER_SAVED,updateGridList);
			service.addEventListener(BaseEvent.REGISTER_DELETED,updateGridList);
			service.addEventListener(BaseEvent.REGISTERS_LOAD_COMPLETE,loadComplete);
		}
		
		
		public function findAll(event:FlexEvent):void{	
			service.findAllCommand();
		}
		
		protected function loadComplete(event:BaseEvent):void{
			view.template.grid.dataProvider = event.resultList;
			view.template.grid.dataProvider.refresh();			
		}
		
		public function get view():RoutePanel{
			return _view as RoutePanel;
		}
		
		public function save(event:Event):void{
			if (prepeareToSave){
				service.saveCommand(route);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(route);
			}
		}
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.template.editRegister;
			var item:Route = Route(event.row);
			view.template.edit.route_id = item.id;
			view.template.edit.description.text = item.description;
			view.template.edit.departure_schedule.text = item.departure_time;
			view.template.edit.return_schedule.text = item.return_time;
			view.template.edit.grid.dataProvider = new ArrayCollection(item.institutions).getItemAt(0) ;
			view.template.edit.grid.dataProvider.refresh();
		}
		
		public function updateGridList(event:BaseEvent):void{			
			selectedChild = view.template.listRegister;
			service.findAllCommand();
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			selectedChild = view.template.listRegister;
			view.template[operation].description.text = "";
			view.template[operation].departure_schedule.text = "";
			view.template[operation].return_schedule.text = "";
			view.template[operation].grid.dataProvider.removeAll()
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new RouteService();
			}
			return _service;
		}
		
		protected function get prepeareToSave():Boolean{
			return getPrepeareStatement(Constants.CREATE);
		}
		
		/** Prepare to Update **/
		
		public function get prepeareToUpdate():Boolean{
			return getPrepeareStatement(Constants.EDIT);
		}
		
		
		protected function getPrepeareStatement(operation:String=Constants.CREATE):Boolean{
			var prepareComplete:Boolean = false;
			route = new Route();
			try{
				route.id = view.template[operation].route_id;
				route.description = view.template[operation].description.text;
				route.departure_schedule = view.template[operation].departure_schedule.text;
				route.return_schedule = view.template[operation].return_schedule.text;
				route.institutions = view.template[operation].grid.dataProvider.source;
				route.created_by = "system_admin";
				
				prepareComplete = true;
			}catch(error:Error){
				Alert.show("ERROR " + error.getStackTrace());
				prepareComplete = false;
			}
			return prepareComplete;
		}
		
		protected function getInstitution(operation:String=Constants.CREATE):Institution{
			var institution:Institution = new Institution();
			institution.id = view.template[operation].institution.item_id;
			institution.name = view.template[operation].institution.searchField.text;			
			return institution;
		}
		
		protected function set selectedChild(child:INavigatorContent):void{
			view.template.stack.selectedChild = child;			
		}
		
		
		private function remove():void{
			var item:BaseModel = view.template.grid.selectedItem as BaseModel;
			service.deleteCommand(item);
		}
		
		public function removeConfirmation(event:BaseEvent):void{
			Alert.okLabel ="Confirmar";
			Alert.buttonWidth = 110;
			Alert.cancelLabel = "Cancelar";			
			Alert.show("Tem certeza que deseja excluir o linha?","Excluir Linha",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
		}
		
		private function removeRowListener(event:CloseEvent):void {
			if (event.detail==Alert.OK) {
				remove(); 
			}
		}
		
		
	}
}