package com.unef.domain.business.payment
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.service.BaseService;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.INavigatorContent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	
	public class PaymentTypeController extends BaseController
	{
		
		private var _service:PaymentTypeService;
		private var payment:PaymentType;
		
		public function PaymentTypeController(view:IView)
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
		
		public function get view():PaymentTypePanel{
			return _view as PaymentTypePanel;
		}
		
		public function save(event:Event):void{
			if (prepeareToSave){
				service.saveCommand(payment);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(payment);
			}
		}
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.template.editPaymentType;
			var item:PaymentType = PaymentType(event.row);
			view.template.edit.payment_id = item.id;
			view.template.edit.description.text = item.description; 
		}
		
		public function updateGridList(event:BaseEvent):void{			
			selectedChild = view.template.listPaymentTypes ;
			service.findAllCommand();
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			view.template[operation].description.text = ""; 
			selectedChild = view.template.listPaymentTypes;
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new PaymentTypeService();
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
			payment = new PaymentType();
			try{
				payment.id = int(view.template[operation].payment_id);
				payment.description = view.template[operation].description.text;
				payment.created_by = "system_admin";
				prepareComplete = true;
			}catch(error:Error){
				prepareComplete = false;
			}
			return prepareComplete;
		}
		
		/** end of prepare to update **/
		
		protected function set selectedChild(child:INavigatorContent):void{
			view.template.stack.selectedChild = child;			
		}
		
		
		private function remove():void{
			var item:PaymentType = view.template.grid.selectedItem as PaymentType;
			service.deleteCommand(item);
		}
		
		public function removeConfirmation(event:BaseEvent):void{
			Alert.okLabel ="Confirmar";
			Alert.buttonWidth = 100;
			Alert.cancelLabel = "Cancelar";			
			Alert.show("Tem certeza que deseja excluir o turno?","Excluir Instituição",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
		}
		
		private function removeRowListener(event:CloseEvent):void {
			if (event.detail==Alert.OK) {
				remove(); 
			}else{
				//view.shiftId = 0;
			}
		}
		
		
		
	}
}