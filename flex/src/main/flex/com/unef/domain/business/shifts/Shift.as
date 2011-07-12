package com.unef.domain.business.shifts
{
	import com.unef.domain.base.model.BaseModel;
	
	[Bindable]
	[RemoteClass(alias="Shift")]
	public class Shift extends BaseModel
	{
		
		private var _description:String;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
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