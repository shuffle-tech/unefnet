package com.unef.domain.business.institutions
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.business.address.Address;
	import com.unef.domain.business.phone.Phone;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.INavigatorContent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	
	public class InstitutionController extends BaseController
	{
		
		
		private var _service:InstitutionService;
		
		private var institution:Institution;
		
		public function InstitutionController(view:IView)
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
		
		public function get view():InstitutionPanel{
			return _view as InstitutionPanel;
		}
		
		public function save(event:Event):void{
			if (prepeareToSave){
				service.saveCommand(institution);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(institution);
			}
		}
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.template.editInstitution;
			var item:Institution = Institution(event.row);
			view.template.edit.institution_id = item.id;
			view.template.edit.address_id = item.address.id;
			view.template.edit.phone_id = item.phone.id;
			view.template.edit.full_name.text = item.name; 
			view.template.edit.web_site.text = item.web_site;
			view.template.edit.street_name.text = item.address.street_name;
			view.template.edit.number.text = item.address.number;
			view.template.edit.zip_code.text = item.address.zip_code;
			view.template.edit.neighborhood.text = item.address.neighborhood;
			view.template.edit.city.text = item.address.city;
			view.template.edit.ddd.text = item.phone.ddd;
			view.template.edit.phone.text = item.phone.phone_number;
		}
		
		public function updateGridList(event:BaseEvent):void{			
			selectedChild = view.template.listInstitutions;
			service.findAllCommand();
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			
			view.template[operation].full_name.text = ""; 
			view.template[operation].web_site.text = "";
			view.template[operation].street_name.text = "";
			view.template[operation].number.text = "";
			view.template[operation].zip_code.text = "";
			view.template[operation].neighborhood.text = "";
			view.template[operation].city.text = "";
			
			view.template[operation].ddd.text = "";
			view.template.create.phone.text = "";
			
			selectedChild = view.template.listInstitutions;
			
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new InstitutionService();
			}
			return _service;
		}
		
		protected function get prepeareToSave():Boolean{
			var prepareComplete:Boolean = false;
			institution = new Institution();
			try{
				institution.name = view.template.create.full_name.text;
				institution.web_site = view.template.create.web_site.text;
				institution.address = address;
				institution.phone = phone;
				prepareComplete = true;
			}catch(error:Error){
				prepareComplete = false;
			}
			return prepareComplete;
		}
		
		protected function get address():Address{
			var address:Address = new Address();
			address.street_name = view.template.create.street_name.text;
			address.number = view.template.create.number.text;
			address.zip_code = view.template.create.zip_code.text;
			address.neighborhood = view.template.create.neighborhood.text;
			address.city = view.template.create.city.text;
			return address;
		}
		
		protected function get phone():Phone{
			var phone:Phone = new Phone();
			phone.ddd = view.template.create.ddd.text;
			phone.phone_number = view.template.create.phone.text;
			phone.type = Phone.PHONE;
			return phone;
		}
		
		/** Prepare to Update **/
		
		public function get prepeareToUpdate():Boolean{
			return getPrepeareStatement(Constants.EDIT);
		}
		
		
		protected function getPrepeareStatement(operation:String=Constants.CREATE):Boolean{
			var prepareComplete:Boolean = false;
			institution = new Institution();
			try{
				institution.id = int(view.template[operation].institution_id);
				institution.name = view.template[operation].full_name.text;
				institution.web_site = view.template[operation].web_site.text;
				institution.address = getAddress(operation);
				institution.phone = getPhone(operation);
				prepareComplete = true;
			}catch(error:Error){
				prepareComplete = false;
			}
			return prepareComplete;
		}
		
		protected function getAddress(operation:String=Constants.EDIT):Address{
			var address:Address = new Address();
			address.id = int(view.template[operation].address_id);
			address.street_name = view.template[operation].street_name.text;
			address.number = view.template[operation].number.text;
			address.zip_code = view.template[operation].zip_code.text;
			address.neighborhood = view.template[operation].neighborhood.text;
			address.city = view.template[operation].city.text;
			return address;
		}
		
		protected function getPhone(operation:String=Constants.CREATE):Phone{
			var phone:Phone = new Phone();
			phone.id = int(view.template[operation].phone_id);
			phone.ddd = view.template[operation].ddd.text;
			phone.phone_number = view.template[operation].phone.text;
			phone.type = Phone.PHONE;
			return phone;
		}
		
		/** end of prepare to update **/
		
		protected function set selectedChild(child:INavigatorContent):void{
			view.template.stack.selectedChild = child;			
		}
		
		
		private function remove():void{
			var item:Institution = view.template.grid.selectedItem as Institution;
			service.deleteCommand(item);
		}
		
		public function detailRow(event:BaseEvent):void{			
			selectedChild = view.template.detailInstitution;
			view.template.details.model = Institution(event.row);
		}
		
		public function removeConfirmation(event:BaseEvent):void{
			Alert.okLabel ="Confirmar";			
			Alert.cancelLabel = "Cancelar";			
			Alert.show("Tem certeza que deseja excluir a instituição?","Excluir Instituição",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
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