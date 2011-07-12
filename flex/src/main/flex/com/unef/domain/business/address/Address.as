package com.unef.domain.business.address
{
	import com.unef.domain.base.model.BaseModel;
	
	
	[Bindable]
	[RemoteClass(alias="Address")]
	public class Address extends BaseModel
	{
		private var _street_name:String;
		private var _number:String;
		private var _neighborhood:String;
		private var _zip_code:String;
		private var _city:String;
		
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;

		public function get created_by():String
		{
			return _created_by;
		}

		public function set created_by(value:String):void
		{
			_created_by = value;
		}

		public function get updated_at():Date
		{
			return _updated_at;
		}

		public function set updated_at(value:Date):void
		{
			_updated_at = value;
		}

		public function get created_at():Date
		{
			return _created_at;
		}

		public function set created_at(value:Date):void
		{
			_created_at = value;
		}

		public function get city():String
		{
			return _city;
		}

		public function set city(value:String):void
		{
			_city = value;
		}

		public function get zip_code():String
		{
			return _zip_code;
		}

		public function set zip_code(value:String):void
		{
			_zip_code = value;
		}

		public function get neighborhood():String
		{
			return _neighborhood;
		}

		public function set neighborhood(value:String):void
		{
			_neighborhood = value;
		}

		public function get number():String
		{
			return _number;
		}

		public function set number(value:String):void
		{
			_number = value;
		}

		public function get street_name():String
		{
			return _street_name;
		}

		public function set street_name(value:String):void
		{
			_street_name = value;
		}

	}
}