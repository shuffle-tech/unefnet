package com.unef.domain.business.institutions.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.institutions.Institution;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class InstitutionsSearchInputComponent extends SearchInputComponent
	{
		
		private var _institutionWindow:InstitutionsSearchContent;
		
		public function InstitutionsSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _institutionWindow){
				_institutionWindow = new InstitutionsSearchContent();
				_institutionWindow.title = "Instituições";
				_institutionWindow.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _institutionWindow; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = Institution(event.row).id;			
			searchField.text = Institution(event.row).name;
		}
		
		
	}
}