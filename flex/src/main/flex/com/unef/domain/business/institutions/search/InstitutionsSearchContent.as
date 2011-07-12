package com.unef.domain.business.institutions.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.institutions.Institution;
	import com.unef.domain.business.institutions.InstitutionService;
	import com.unef.domain.business.institutions.event.InstitutionEvent;
	import com.unef.renderers.CheckBoxItemRenderer;
	import com.unef.util.search.SearchContent;
	
	import mx.events.FlexEvent;
	
	public class InstitutionsSearchContent extends SearchContent
	{
		private var service:InstitutionService;
		
		public function InstitutionsSearchContent()
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
			service = new InstitutionService();
			service.addEventListener(BaseEvent.REGISTERS_LOAD_COMPLETE,loadComplete);
			service.findAllCommand();
		}
		
		protected function loadComplete(event:BaseEvent):void{
			dataProvider = event.resultList;		
			dataProvider.refresh();
		}
		
		public function getResult(element:Object):void{
			var selectedRegister:InstitutionEvent = new InstitutionEvent(BaseEvent.SELECTED_REGISTER);
			selectedRegister.row = element as Institution;
			dispatchEvent(selectedRegister);
		}
		
		override public function get callback():Function{
			  return getResult;
		} 
		
		protected function addColumns():void{			
			addColumn("Nome","name");
			addColumn("Telefone","formatted_phone");
			addColumn("Bairro","neighborhood");
			addColumn("Cidade","city");
		}
		
		
	}
}