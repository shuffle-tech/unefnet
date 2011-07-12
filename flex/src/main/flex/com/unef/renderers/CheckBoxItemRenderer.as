package com.unef.renderers
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class CheckBoxItemRenderer extends CheckBoxGridRendererTemplate
	{
		
		override protected function initializationComplete():void{
			addEventListener(FlexEvent.CREATION_COMPLETE, initializeListeners);
		}
		
		override public function set data(value:Object):void{
			super.data = value;
			data.selected = selectedRow.selected;
		}
		
		public function initializeListeners(event:FlexEvent):void{
			selectedRow.addEventListener(Event.CHANGE, setSelected);
		}
		
		public function setSelected(event:Event):void
		{
			data.selected = !data.selected;
		}
	}
}