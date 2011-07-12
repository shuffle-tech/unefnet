package com.unef.domain.business.phone
{
	import com.unef.domain.base.model.BaseModel;
	
	
	[Bindable]
	[RemoteClass(alias="Phone")]
	public class Phone extends BaseModel
	{
		
		public static const CELPHONE:int = 1;
		public static const PHONE:int = 2;
		public static const MESSAGES:int = 3;
		
		private var _ddd:String;
		private var _phone_number:String;
		private var _type:int;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;
		
		public function get ddd():String
		{
			return _ddd;
		}

		public function set ddd(value:String):void
		{
			_ddd = value;
		}

		public function get phone_number():String
		{
			return _phone_number;
		}

		public function set phone_number(value:String):void
		{
			_phone_number = value;
		}

		public function get type():int
		{
			return _type;
		}

		public function set type(value:int):void
		{
			_type = value;
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


	}
}