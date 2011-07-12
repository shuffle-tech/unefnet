package com.unef.domain.business.associated.model
{
	import com.unef.domain.business.address.Address;
	import com.unef.domain.model.BaseModel;
	
	[Bindable]
	[RemoteClass(alias="Associated")]
	public class Associated extends BaseModel
	{
		
		public var cpf:String;
		public var first_name:String;
		public var last_name:String;
		public var social_number:String;
		public var gender:String;
		public var birthdate:Date;
		public var email:String;
		public var active:Boolean;
		public var address:Address;
		public var phone:Phone;
		public var mobile:Phone;
		public var messages:Phone;
		public var created_at:Date;
		public var updated_at:Date;
		public var created_by:String;
		
		
		public function get full_name():String{
			return StringUtil.substitute("{0} {1}",first_name,last_name);
		} 
		
		public function get formatted_cpf():String{
			return "";
		}
	}
}