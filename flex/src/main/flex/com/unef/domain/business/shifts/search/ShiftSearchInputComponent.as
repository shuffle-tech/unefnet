package com.unef.domain.business.shifts.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.shifts.Shift;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class ShiftSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:ShiftSearchContent;
		
		public function ShiftSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new ShiftSearchContent();
				_content.title = "Turnos";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = Shift(event.row).id;
			searchField.text = Shift(event.row).description;
		}
		
		
	}
}