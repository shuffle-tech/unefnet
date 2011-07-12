package com.unef.domain.business.associated.type
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.business.associated.type.AssociatedType;
	import com.unef.domain.business.associated.type.AssociatedTypeService;
	import com.unef.domain.business.contracts.Contract;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.INavigatorContent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	
	public class AssociatedTypeController extends BaseController
	{
		
		private var _service:AssociatedTypeService;
		private var type:AssociatedType;
		
		public function AssociatedTypeController(view:IView)
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
		
		public function get view():AssociatedTypePanel{
			return _view as AssociatedTypePanel;
		}
		
		public function save(event:Event):void{
			if (prepeareToSave){
				service.saveCommand(type);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(type);
			}
		}
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.template.editRegister;
			var item:AssociatedType = AssociatedType(event.row);
			view.template.edit.type_id = item.id;
			view.template.edit.modality.text = item.modality; 
			view.template.edit.value.text = item.value.toString(); 
			view.template.edit.discount_value.text = item.discount_value.toString(); 
			view.template.edit.contract.item_id = item.contract.id; 
			view.template.edit.contract.searchField.text = item.contract.description; 
		}
		
		public function updateGridList(event:BaseEvent):void{			
			selectedChild = view.template.listRegister;
			service.findAllCommand();
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			view.template[operation].description.text = ""; 
			selectedChild = view.template.listRegister;
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new AssociatedTypeService();
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
			type = new AssociatedType();
			try{
				type.id = view.template[operation].type_id;
				type.modality = view.template[operation].modality.text;
				type.value = view.template[operation].value.text;
				type.discount_value = view.template[operation].discount_value.text;
				type.contract = getContract(operation);
				type.created_by = "system_admin";
				prepareComplete = true;
			}catch(error:Error){
				prepareComplete = false;
			}
			return prepareComplete;
		}
		
		protected function getContract(operation:String=Constants.EDIT):Contract{
			var contract:Contract = new Contract();
			contract.id = view.template[operation].contract.item_id;
			contract.description = view.template[operation].contract.searchField.text;
			return contract;
		}
		
		/** end of prepare to update **/
		
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
			Alert.show("Tem certeza que deseja excluir o tipo de associado?","Excluir Tipo de Associado",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
		}
		
		private function removeRowListener(event:CloseEvent):void {
			if (event.detail==Alert.OK) {
				remove(); 
			}
		}
		
		
		
	}
}