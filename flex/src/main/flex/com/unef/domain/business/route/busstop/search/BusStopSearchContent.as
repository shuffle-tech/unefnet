package com.unef.domain.business.route.busstop.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.route.busstop.BusStopService;
	import com.unef.util.search.SearchContent;
	
	import mx.events.FlexEvent;
	
	public class BusStopSearchContent extends SearchContent
	{
		private var service:BusStopService;
		
		public function BusStopSearchContent()
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE,findAll);			
			addEventListener(FlexEvent.ADD,findAll);
		}
		
		override protected function setUpApplication(event:FlexEvent):void{
			super.setUpApplication(event);
			addColumns();			
		}
		
		protected function findAll(event:FlexEvent):void{	
			service = new BusStopService();
			service.addEventListener(BaseEvent.REGISTERS_LOAD_COMPLETE,loadComplete);
			service.findAllCommand();
		}
		
		protected function loadComplete(event:BaseEvent):void{
			dataProvider = event.resultList;		
			dataProvider.refresh();
		}
		
		public function getResult(element:Object):void{
			var selectedRegister:BaseEvent = new BaseEvent(BaseEvent.SELECTED_REGISTER);
			selectedRegister.row = element as BaseModel;
			dispatchEvent(selectedRegister);
		}
		
		override public function get callback():Function{
			  return getResult;
		} 
		
		protected function addColumns():void{
			addColumn("Bairro","neighborhood");
			addColumn("Cidade","city");
		}
		
		
	}
}