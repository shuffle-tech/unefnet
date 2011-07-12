package com.unef.domain.business.associated.type.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.associated.course.crud.AssociatedCourseCreateEditTemplate;
	import com.unef.domain.business.associated.type.AssociatedType;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	import mx.utils.StringUtil;
	
	public class AssociatedTypeSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:AssociatedTypeSearchContent;
		
		public function AssociatedTypeSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new AssociatedTypeSearchContent();
				_content.title = "Modalidade de associado";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = AssociatedType(event.row).id;			
			searchField.text = AssociatedType(event.row).modality;
			AssociatedCourseCreateEditTemplate(caller).value.text = StringUtil.substitute("R$ {0},00",AssociatedType(event.row).value);;  
		}
		
		
	}
}