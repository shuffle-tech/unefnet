package com.unef.domain.business.contracts.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.contracts.Contract;
	import com.unef.domain.business.contracts.search.ContractSearchContent;
	import com.unef.domain.business.course.Course;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class ContractSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:ContractSearchContent;
		
		public function ContractSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new ContractSearchContent();
				_content.title = "Contratos";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = Contract(event.row).id;			
			searchField.text = Contract(event.row).description;
		}
		
		
	}
}