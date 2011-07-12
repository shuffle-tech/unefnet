package com.unef.domain.business.route.busstop.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.payment.PaymentType;
	import com.unef.domain.business.route.busstop.BusStop;
	import com.unef.domain.business.route.busstop.search.BusStopSearchContent;
	import com.unef.util.search.component.SearchInputComponent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	
	public class BusStopSearchInputComponent extends SearchInputComponent
	{
		
		private var _content:BusStopSearchContent;
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _content){
				_content = new BusStopSearchContent();
				_content.title = "Pontos de Embarque e Desembarque";
				_content.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _content; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			item_id = BusStop(event.row).id;			
			searchField.text = BusStop(event.row).neighborhood;
		}
		
		
	}
}