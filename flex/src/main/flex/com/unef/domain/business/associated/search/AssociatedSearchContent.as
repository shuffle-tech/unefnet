package com.unef.domain.business.associated.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.associated.AssociatedService;
	import com.unef.domain.business.contracts.ContractService;
	import com.unef.util.search.SearchContent;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	import mx.utils.ObjectUtil;
	
	public class AssociatedSearchContent extends SearchContent
	{
		private var service:AssociatedService;
		
		public function AssociatedSearchContent()
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
			service = new AssociatedService();
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
			addColumn("Nome","full_name");
			addColumn("CPF","cpf");
		}
		
		
	}
}