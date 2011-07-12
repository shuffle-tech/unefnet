package com.unef.domain.business.users
{
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.address.Address;
	import com.unef.domain.business.phone.Phone;
	import com.unef.domain.business.responsible.Responsible;
	
	import mx.formatters.DateFormatter;
	import mx.utils.StringUtil;
	
	[Bindable]
	[RemoteClass(alias="Users")]
	public class User extends BaseModel
	{
		private var _cpf:String;
		private var _full_name:String;
		private var _first_name:String;
		private var _last_name:String;
		private var _social_number:String;
		private var _gender:String;
		private var _birthdate:Date;
		private var _email:String;
		private var _active:Boolean;
		private var _address:Address;
		private var _phone:Phone;
		private var _mobile:Phone;
		private var _messages:Phone;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;
		
		public function get rg():String{
			return _social_number;
		}
		
		public function get formatted_birthdate():String{
			var date:Date = _birthdate;
			var formatter:DateFormatter = new DateFormatter();
			formatter.formatString = "DD/MM/YYYY";
			return formatter.format(date);;
		}
		
		public function get full_name():String{
			//return StringUtil.substitute("{0} {1}",first_name,last_name);
			return _full_name;
		} 
		
		public function set full_name(name:String):void{
			_full_name = name;
		}
		
		public function get formatted_cpf():String{
			return "";
		}
		
		public function get cpf():String
		{
			return _cpf;
		}
		
		public function set cpf(value:String):void
		{
			_cpf = value;
		}
		
		public function get first_name():String
		{
			return _first_name;
		}
		
		public function set first_name(value:String):void
		{
			_first_name = value;
		}
		
		public function get last_name():String
		{
			return _last_name;
		}
		
		public function set last_name(value:String):void
		{
			_last_name = value;
		}
		
		public function get social_number():String
		{
			return _social_number;
		}
		
		public function set social_number(value:String):void
		{
			_social_number = value;
		}
		
		public function get gender():String
		{
			return _gender;
		}
		
		public function set gender(value:String):void
		{
			_gender = value;
		}
		
		public function get birthdate():Date
		{
			return _birthdate;
		}
		
		public function set birthdate(value:Date):void
		{
			_birthdate = value;
		}
		
		public function get email():String
		{
			return _email;
		}
		
		public function set email(value:String):void
		{
			_email = value;
		}
		
		public function get active():Boolean
		{
			return _active;
		}
		
		public function set active(value:Boolean):void
		{
			_active = value;
		}
		
		public function get address():Address
		{
			return _address;
		}
		
		public function set address(value:Address):void
		{
			_address = value;
		}
		
		public function get phone():Phone
		{
			return _phone;
		}
		
		public function set phone(value:Phone):void
		{
			_phone = value;
		}
		
		public function get mobile():Phone
		{
			return _mobile;
		}
		
		public function set mobile(value:Phone):void
		{
			_mobile = value;
		}
		
		public function get messages():Phone
		{
			return _messages;
		}
		
		public function set messages(value:Phone):void
		{
			_messages = value;
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