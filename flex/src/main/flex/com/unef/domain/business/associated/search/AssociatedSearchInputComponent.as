package com.unef.domain.business.associated.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.associated.Associated;
	import com.unef.domain.business.users.User;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.controls.Alert;
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class AssociatedSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:AssociatedSearchContent;
		
		public function AssociatedSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new AssociatedSearchContent();
				_content.title = "Associados";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = User(event.row).id;			
			searchField.text = User(event.row).full_name;
		}
		
		
	}
}