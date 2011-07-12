package com.unef.domain.business.associated
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.business.address.Address;
	import com.unef.domain.business.associated.crud.AssociatedFormTemplate;
	import com.unef.domain.business.phone.Phone;
	import com.unef.domain.business.responsible.Responsible;
	import com.unef.util.FormUtil;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.describeType;
	
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.core.Container;
	import mx.core.INavigatorContent;
	import mx.core.UIComponent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.utils.ObjectUtil;
	
	import spark.components.RadioButton;
	import spark.components.RadioButtonGroup;
	
	public class AssociatedController extends BaseController
	{
		
		private var _service:AssociatedService;
		private var associated:Associated;
		
		public function AssociatedController(view:IView)
		{
			super(view);
		}
		
		
		override public function initializeListeners(event:FlexEvent):void
		{
			super.initializeListeners(event);
			addEventListener(FlexEvent.CREATION_COMPLETE,findAll);
			view.create.associatedCourseForm.add.addEventListener(MouseEvent.CLICK,addAssociatedCourse);
			
			//			view.addEventListener(AssociatedEvent.DETAIL,);
			view.addEventListener(AssociatedEvent.EDIT,editRow);
			//			view.addEventListener(AssociatedEvent.REMOVE,);
			//			view.addEventListener(AssociatedEvent.ANNUL_CONTRACT,);
			view.addEventListener(AssociatedEvent.ADD, addAssociated);
			view.addEventListener(AssociatedEvent.SAVE,save);
			view.addEventListener(AssociatedEvent.NEXT,goForward);
			view.addEventListener(AssociatedEvent.PREV,goBackward);
			view.addEventListener(AssociatedEvent.CANCEL,cancel);
			
			service.addEventListener(BaseEvent.REGISTER_SAVED,updateGridList);
			service.addEventListener(BaseEvent.REGISTER_DELETED,updateGridList);
			service.addEventListener(BaseEvent.REGISTERS_LOAD_COMPLETE,loadComplete);
			
			
		}
		
		
		protected function goForward(event:AssociatedEvent):void{
			crudSelectedChild = (crudSelectedChild == view.create.addAssociated) ? view.create.addAssociatedCourse : view.create.addResponsible;
		}
		
		protected function goBackward(event:AssociatedEvent):void{
			crudSelectedChild = (crudSelectedChild == view.create.addResponsible) ? view.create.addAssociatedCourse : view.create.addAssociated ;
		}
		
		protected function get crudSelectedChild():INavigatorContent{
			return view.create.stack.selectedChild;
		}
		
		protected function set crudSelectedChild(child:INavigatorContent):void{
			view.create.stack.selectedChild = child;
		}
		
		protected function addAssociated(event:AssociatedEvent):void{
			view.stack.selectedChild = view.addRegister;
		}
		
		public function findAll(event:FlexEvent):void{	
			showProgressMonitor();
			service.findAllCommand();
		}
		
		protected function loadComplete(event:BaseEvent):void{
			view.grid.dataProvider = event.resultList;
			view.grid.dataProvider.refresh();
			hideProgressMonitor();
		}
		
		public function get view():AssociatedUIResource{
			return _view as AssociatedUIResource;
		}
		
		public function save(event:AssociatedEvent):void{
			if (prepeareToSave){
				service.saveCommand(associated);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(associated);
			}
		}
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.editRegister;
			var item:Associated = Associated(event.row);
			view.edit.item_id = item.id;
			FormUtil.populate(item,view.edit.associatedForm);
			FormUtil.populate(item,view.edit.associatedCourseForm);
		}
		
		
		
		public function updateGridList(event:BaseEvent):void{			
			//			selectedChild = view.listShifts;
			//			service.findAllCommand();
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			FormUtil.clearFields(view[operation].associatedForm);
			FormUtil.clearFields(view[operation].associatedCourseForm);
			FormUtil.clearFields(view[operation].responsibleForm);
			selectedChild = view.listRegisters;
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new AssociatedService();
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
			associated = null;
			try{
//				//				associated.id = view.template[operation].associated_id;
//				associated.cpf = view.create.associatedForm.cpf.text;
//				associated.first_name = view.create.associatedForm.first_name.text;
//				associated.last_name  = view.create.associatedForm.last_name.text;
//				associated.social_number = view.create.associatedForm.rg.text;
//				associated.gender = view.create.associatedForm.gender.selectedValue.toString();
//				associated.birth_date = view.create.associatedForm.birthdate.selectedDate;
//				associated.email = view.create.associatedForm.email.text;
//				associated.active = true;
//				associated.address = address;
//				associated.phone = phone;
//				associated.mobile = mobile;
//				associated.messages = messages;
//				associated.responsible = responsible;
				
				associated = FormUtil.populateModel(view.create.associatedForm,new Associated()) as Associated;
				associated.address = address;
				associated.phone = phone;
				associated.mobile = mobile;
				associated.messages = messages;
				
				prepareComplete = true;
			}catch(error:Error){
				error.getStackTrace();
				prepareComplete = false;
			}
			return prepareComplete;
		}
		
		/** end of prepare to update **/
		
		protected function set selectedChild(child:INavigatorContent):void{
			view.stack.selectedChild = child;			
		}
		
		
		private function remove():void{
			var item:BaseModel = view.grid.selectedItem as BaseModel;
			service.deleteCommand(item);
		}
		
		public function removeConfirmation(event:BaseEvent):void{
			Alert.okLabel ="Confirmar";
			Alert.buttonWidth = 110;
			Alert.cancelLabel = "Cancelar";			
			Alert.show("Tem certeza que deseja excluir o associado?","Excluir Associado",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
		}
		
		private function removeRowListener(event:CloseEvent):void {
			if (event.detail==Alert.OK) {
				remove(); 
			}
		}
		
		private function addAssociatedCourse(event:MouseEvent):void{
			view.create.associatedCourseForm.stack.selectedChild = view.create.associatedCourseForm.addRegister;
		}
		
		//
		
		protected function get phone():Phone{
			var phone:Phone = new Phone();
			phone.type = Phone.PHONE;
			phone.ddd = view.create.associatedForm.phone_ddd.text;
			phone.phone_number = view.create.associatedForm.phone.text;
			return phone;
		}
		
		protected function get messages():Phone{
			var phone:Phone = new Phone();
			phone.type = Phone.MESSAGES;
			phone.ddd = view.create.associatedForm.messages_ddd.text;
			phone.phone_number = view.create.associatedForm.messages.text;
			return phone;
		}
		
		protected function get mobile():Phone{
			var phone:Phone = new Phone();
			phone.type = Phone.CELPHONE;
			phone.ddd = view.create.associatedForm.celphone_ddd.text;
			phone.phone_number = view.create.associatedForm.celphone.text;
			return phone;
		}
		
		protected function get address():Address{
			var address:Address = new Address();
			address.city = view.create.associatedForm.city.text;
			address.neighborhood = view.create.associatedForm.neighborhood.text;
			address.number = view.create.associatedForm.number.text;
			address.street_name = view.create.associatedForm.street_name.text;
			address.zip_code = view.create.associatedForm.cep.text;			
			return address;
		}
		
		protected function get responsible():Responsible{
			var responsible:Responsible = new Responsible();
			try{
				//				responsible.id = view.template[operation].responsible_id;
				responsible.cpf = view.create.responsibleForm.cpf.text;
				responsible.first_name = view.create.responsibleForm.first_name.text;
				responsible.last_name  = view.create.responsibleForm.last_name.text;
				responsible.social_number = view.create.responsibleForm.rg.text;
				responsible.gender = view.create.responsibleForm.gender.selectedValue.toString();
				responsible.birthdate = view.create.responsibleForm.birthdate.selectedDate;
				responsible.email = view.create.responsibleForm.email.text;
				responsible.active = true;
				responsible.address = address;
				responsible.phone = phone;
				responsible.mobile = mobile;
				responsible.messages = messages;
			}catch(error:Error){
			}
			return responsible;
		}
	}
}