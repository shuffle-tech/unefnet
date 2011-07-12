package com.unef.domain.business.payment.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.payment.PaymentType;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class PaymentTypeSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:PaymentTypeSearchContent;
		
		public function PaymentTypeSearchInputComponent()
		{
			super();
		}
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new PaymentTypeSearchContent();
				_content.title = "Tipos de pagamento";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = PaymentType(event.row).id;			
			searchField.text = PaymentType(event.row).description;
		}
		
		
	}
}