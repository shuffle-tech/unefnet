package com.unef.domain.business.billet.renderer
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.billet.Billet;
	import com.unef.domain.business.billet.event.BilletEvent;
	import com.unef.renderers.DatagridItemRenderer;
	import com.unef.renderers.DatagridOperationsRendererTemplate;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	[Event(name="visualize", type="com.unef.domain.business.billet.event.BilletEvent")]
	[Event(name="cancel", type="com.unef.domain.business.billet.event.BilletEvent")]
	[Event(name="toWriteOff", type="com.unef.domain.business.billet.event.BilletEvent")]
	
	public class BilletGridRenderer extends BilletDatagridOperationsRendererTemplate
	{
		
		override protected function initializationComplete():void{
			addEventListener(FlexEvent.CREATION_COMPLETE, initializeListeners);
		}
		
		public function initializeListeners(event:FlexEvent):void{
			visualize.addEventListener(MouseEvent.CLICK, visualizeBillet);
			cancel.addEventListener(MouseEvent.CLICK, cancelBillet);	
			toWriteOff.addEventListener(MouseEvent.CLICK, toWriteOffBillet);	
		}
		
		public function toWriteOffBillet(event:MouseEvent):void{
			var billetEvent:BilletEvent = new BilletEvent(BilletEvent.TO_WRITE_OFF_BILLET);
			billetEvent.billet = data as Billet;
			owner.dispatchEvent(billetEvent);
		}
		
		public function visualizeBillet(event:MouseEvent):void{
			var billetEvent:BilletEvent = new BilletEvent(BilletEvent.VISUALIZE_BILLET);
			billetEvent.billet = data as Billet;
			owner.dispatchEvent(billetEvent);
		}
		
		public function cancelBillet(event:MouseEvent):void{
			var billetEvent:BilletEvent = new BilletEvent(BilletEvent.CANCEL_BILLET);
			billetEvent.billet = data as Billet;
			owner.dispatchEvent(billetEvent);
		}
	}
}