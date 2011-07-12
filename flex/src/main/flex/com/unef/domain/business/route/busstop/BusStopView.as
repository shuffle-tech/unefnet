package com.unef.domain.route.busstop
{
	import com.unef.domain.events.BaseEvent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class BusStopView extends BusStopDesigner
	{
		public var controller:BusStopController;
		
		public function BusStopView()
		{
			super();
			controller = new BusStopController(this);
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners);
			addEventListener(FlexEvent.CREATION_COMPLETE,controller.findAll);
		}
		
		protected function initializeListeners(event:FlexEvent):void{		
			add.addEventListener(MouseEvent.CLICK, controller.add);
			cancel.addEventListener(MouseEvent.CLICK, controller.cancel);			
			saveCommand.addEventListener(MouseEvent.CLICK,controller.save);
			addEventListener(BaseEvent.EDIT_ROW_START,controller.editRow);
			addEventListener(BaseEvent.DELETE_ROW_REQUEST,controller.removeConfirmation);
		}
	}
}