package com.unef.domain.business.associated
{
	import flash.events.Event;
	
	public class AssociatedEvent extends Event
	{
		
		public static const DETAIL:String = "detail";
		public static const EDIT:String = "edit";
		public static const REMOVE:String = "remove";
		public static const ANNUL_CONTRACT:String = "anullContract";
		public static const ADD:String = "add";
		public static const SAVE:String = "save";
		public static const NEXT:String = "next";
		public static const PREV:String = "prev";
		public static const CANCEL:String = "cancel";
		public static const FIND_ALL:String = "findAll";
		
		private var _step:String;
		
		public function AssociatedEvent(type:String)
		{
			super(type);
		}
		
		override public function clone():Event{
			return new AssociatedEvent(type);
		}

		public function get step():String
		{
			return _step;
		}

		public function set step(value:String):void
		{
			_step = value;
		}

	}
}