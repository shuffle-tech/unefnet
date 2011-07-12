package com.unef.events
{
	import flash.events.Event;
	
	public class ResettableFormEvent extends Event
	{
		public static const RESET_CLICK:String = "resetClick";
		
		public function ResettableFormEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}