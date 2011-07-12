package com.unef.domain.business.institutions
{
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.address.Address;
	import com.unef.domain.business.phone.Phone;
	
	import mx.utils.StringUtil;
	
	[Bindable]
	[RemoteClass(alias="Institution")]
	public class Institution extends BaseModel
	{
		private var _name:String;
		private var _active:Boolean;
		private var _phone:Phone;
		private var _address:Address;
		private var _web_site:String;
		
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;
		
		
		public function get name():String
		{
			return _name;
		}

		public function set name(value:String):void
		{
			_name = value;
		}

		public function get active():Boolean
		{
			return _active;
		}

		public function set active(value:Boolean):void
		{
			_active = value;
		}

		public function get phone():Phone
		{
			return _phone;
		}

		public function set phone(value:Phone):void
		{
			_phone = value;
		}

		public function get address():Address
		{
			return _address;
		}

		public function set address(value:Address):void
		{
			_address = value;
		}

		public function get web_site():String
		{
			return _web_site;
		}

		public function set web_site(value:String):void
		{
			_web_site = value;
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
		
		public function get formatted_phone():String{
			var format:String = "({0}) {1}";
			var formatted:String = StringUtil.substitute(format,phone.ddd,phone.phone_number);
			return formatted;
		}
		
		public function get city():String{
			return address.city;
		}
		
		public function get neighborhood():String{
			return address.neighborhood;
		}
		
		public function get full_street_name():String{
			
			return StringUtil.substitute("{0},{1}",address.street_name,address.number);
		}
		
		public function get formatted_zip_code():String{
			var zip:String = StringUtil.substitute("{0}-{1}",address.zip_code.substr(0,4),address.zip_code.substr(5,7));
			return zip;
		}


	}
}