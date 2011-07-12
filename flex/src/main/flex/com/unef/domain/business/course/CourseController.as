package com.unef.domain.business.course
{
	import com.unef.domain.base.constants.Constants;
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.business.institutions.Institution;
	
	import flash.events.Event;
	
	import mx.controls.Alert;
	import mx.core.INavigatorContent;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	
	public class CourseController extends BaseController
	{
		
		private var _service:CourseService;
		private var course:Course;
		
		public function CourseController(view:IView)
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
		
		public function get view():CoursePanel{
			return _view as CoursePanel;
		}
		
		public function save(event:Event):void{
			if (prepeareToSave){
				service.saveCommand(course);
			}
		}
		
		public function update(event:Event):void{
			if (prepeareToUpdate){
				service.updateCommand(course);
			}
		}
		
		public function editRow(event:BaseEvent):void{			
			selectedChild = view.template.editCourse;
			var item:Course = Course(event.row);
			view.template.edit.course_id = item.id;
			view.template.edit.description.text = item.description; 
			view.template.edit.title.text = item.title; 
			view.template.edit.institution.item_id = item.institution.id; 
			view.template.edit.institution.searchField.text = item.institution.name; 
		}
		
		public function updateGridList(event:BaseEvent):void{			
			selectedChild = view.template.listCourses;
			service.findAllCommand();
		}
		
		public function cancel(event:Event,operation:String=Constants.CREATE):void{
			selectedChild = view.template.listCourses;
			view.template[operation].description.text = "";
			view.template[operation].title.text = ""; 
			view.template[operation].institution.item_id = 0; 
			view.template[operation].institution.searchField.text = "";
		}
		
		override public function get service():BaseService{
			if (null == _service){
				_service = new CourseService();
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
			course = new Course();
			try{
				course.id = view.template[operation].course_id;
				course.description = view.template[operation].description.text;
				course.title = view.template[operation].title.text;
				course.institution = getInstitution(operation);
				course.created_by = "system_admin";
				prepareComplete = true;
			}catch(error:Error){
				Alert.show(error.getStackTrace());
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
		
		
		
		/** end of prepare to update **/
		
		protected function set selectedChild(child:INavigatorContent):void{
			view.template.stack.selectedChild = child;			
		}
		
		
		private function remove():void{
			var item:Course = view.template.grid.selectedItem as Course;
			service.deleteCommand(item);
		}
		
		public function removeConfirmation(event:BaseEvent):void{
			Alert.okLabel ="Confirmar";
			Alert.buttonWidth = 70;
			Alert.cancelLabel = "Cancelar";			
			Alert.show("Tem certeza que deseja excluir o curso?","Excluir Curso",Alert.OK | Alert.CANCEL,view,removeRowListener,null,Alert.OK);
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