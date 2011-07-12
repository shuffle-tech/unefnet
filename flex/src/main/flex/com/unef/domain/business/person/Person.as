package com.unef.domain.business.person
{
	import com.unef.domain.business.address.Address;
	import com.unef.domain.business.phone.Phone;
	import com.unef.domain.model.BaseModel;
	
	public class Person extends BaseModel
	{
		public var first_name:String;
		public var last_name:String;
		public var gender:String;
		public var email:String;
		public var active:Boolean;
		public var created_at:Date;
		public var updated_at:Date;
		public var created_by:String;
		
	}
}