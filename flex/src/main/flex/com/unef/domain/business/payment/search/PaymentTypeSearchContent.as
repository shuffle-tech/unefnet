package com.unef.domain.business.payment.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.course.CourseService;
	import com.unef.domain.business.payment.PaymentTypeService;
	import com.unef.util.search.SearchContent;
	
	import mx.events.FlexEvent;
	
	public class PaymentTypeSearchContent extends SearchContent
	{
		private var service:PaymentTypeService;
		
		public function PaymentTypeSearchContent()
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
			service = new PaymentTypeService();
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
		}
		
		
	}
}