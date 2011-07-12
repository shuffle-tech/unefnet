package com.unef.domain.business.route.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.course.Course;
	import com.unef.domain.business.route.Route;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class RouteSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:RouteSearchContent;
		
		public function RouteSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new RouteSearchContent();
				_content.title = "Linhas";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = Route(event.row).id;
			searchField.text = Route(event.row).description;
		}
		
		
	}
}