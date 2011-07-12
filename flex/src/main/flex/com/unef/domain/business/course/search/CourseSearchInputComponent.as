package com.unef.domain.business.course.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.course.Course;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class CourseSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:CourseSearchContent;
		
		public function CourseSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new CourseSearchContent();
				_content.title = "Cursos";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = Course(event.row).id;			
			searchField.text = Course(event.row).description;
		}
		
		
	}
}