package com.unef.domain.business.route.busstop
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.service.BaseService;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.INavigatorContent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	
	public class BusStopController extends BaseController
	{
		private var _service:BusStopService;
		private var busstop:BusStop;
		
		public function BusStopController(view:IView)
		{
			super(view);
			
		}
		
		override public function initializeListeners(event:FlexEvent):void
		{
			super.initializeListeners(event);
			addEventListener(FlexEvent.CREATION_COMPLETE,findAll);
			service.addEventListener(BaseEvent.REGISTER_SAVED,updateGridList);
			service.addEventListener(BaseEvent.REGISTER_SAVED,clearFields);
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
		
		public function get view():BusStopPanel{
			return _view as BusStopPanel;
		}
		
		
		public function save(event:Event):void{
			if (prepeareToSave){
				service.saveCommand(busstop);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(busstop);
			}
		}
		
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.template.editBusStop;
			var item:BusStop = BusStop(event.row);
			view.template.edit.busstop_id = item.id;
			view.template.edit.neighborhood.text = item.neighborhood; 
			view.template.edit.city.text = item.city; 
		}
		
		public function updateGridList(event:BaseEvent):void{			
			selectedChild = view.template.listBusStops;
			service.findAllCommand();
		}
		
		protected function clearFields(event:BaseEvent):void{
			view.template.create.neighborhood.text = ""; 
			view.template.create.city.text = "";
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			view.template[operation].neighborhood.text = ""; 
			view.template[operation].city.text = ""; 
			selectedChild = view.template.listBusStops;
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new BusStopService();
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
			busstop = new BusStop();
			try{
				busstop.id = int(view.template[operation].busstop_id);
				busstop.neighborhood = view.template[operation].neighborhood.text;
				busstop.city = view.template[operation].city.text;
				busstop.created_by = "system_admin";
				prepareComplete = true;
			}catch(error:Error){
				prepareComplete = false;
			}
			return prepareComplete;
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
			Alert.buttonWidth = 70;
			Alert.cancelLabel = "Cancelar";			
			Alert.show("Tem certeza que deseja excluir o ponto de embarque e desembarque?","Excluir Ponto de Embarque e Desembarque",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
		}
		
		private function removeRowListener(event:CloseEvent):void {
			if (event.detail==Alert.OK) {
				remove(); 
			}
		}
	}
}