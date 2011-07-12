package com.unef.util.search
{
	import flash.events.Event;
	
	public class SearchContentEvent extends Event
	{
		public function SearchContentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}