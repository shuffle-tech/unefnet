package com.unef.domain.business.route.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.institutions.Institution;
	import com.unef.domain.business.route.RouteService;
	import com.unef.util.search.SearchContent;
	
	import mx.events.FlexEvent;
	
	public class RouteSearchContent extends SearchContent
	{
		private var service:RouteService;
		
		public function RouteSearchContent()
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
			service = new RouteService();
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
			addColumn("Descrição","description");
			addColumn("Período","period");
			addColumn("Saída","departure_schedule");
			addColumn("Retorno","return_schedule");
		}
		
		
	}
}