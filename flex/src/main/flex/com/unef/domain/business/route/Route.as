package com.unef.domain.business.route
{
	import com.unef.domain.base.model.BaseModel;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;

	[Bindable]
	[RemoteClass(alias="Route")]
	public class Route extends BaseModel
	{
		
		private var _description:String;
		private var _period:int;
		private var _departure_schedule:String;
		private var _return_schedule:String;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;
		[ArrayElementType("com.unef.domain.business.institutions.Institution")]
		private var _institutions:Array = new Array;

		public function get departure_time():String{
			return  departure_schedule.replace(":","").substring(0,3)
		}
		
		public function get return_time():String{
			return return_schedule.replace(":","").substring(0,3)
		}
		
		
		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}

		public function get period():int
		{
			return _period;
		}

		public function set period(value:int):void
		{
			_period = value;
		}

		public function get departure_schedule():String
		{
			return _departure_schedule;
		}

		public function set departure_schedule(value:String):void
		{
			_departure_schedule = value;
		}

		public function get return_schedule():String
		{
			return _return_schedule;
		}

		public function set return_schedule(value:String):void
		{
			_return_schedule = value;
		}

		public function get created_at():Date
		{
			return _created_at;
		}

		public function set created_at(value:Date):void
		{
			_created_at = value;
		}

		public function get updated_at():Date
		{
			return _updated_at;
		}

		public function set updated_at(value:Date):void
		{
			_updated_at = value;
		}

		public function get created_by():String
		{
			return _created_by;
		}

		public function set created_by(value:String):void
		{
			_created_by = value;
		}

		public function get institutions():Array
		{
			return _institutions;
		}

		public function set institutions(value:Array):void
		{
			_institutions = value;
		}

	}
}