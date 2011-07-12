package com.unef.domain.base.environment.workspace {
	
	import com.unef.util.Map;
	
	import flash.events.Event;
	
	public class ModuleLoaderEvent extends Event {
		
		public static const RESULT:String = "result";
		
		public static const FAULT:String = "fault";
		
		private var _memory:Map;
		
		public function ModuleLoaderEvent(type:String, memory:Map) {
			super(type);
			this._memory = memory;
		}
		
		public function get memory():Map {
			return this._memory;
		}
	
	}
}
