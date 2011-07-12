package com.unef.domain.business.customer.model
{
	import com.unef.domain.business.person.Person;
	
	
	public class Customer extends Person
	{
		public var cpf:String;
		public var social_number:String;
		public var birthdate:Date;
		public var active:Boolean;
		public var address:Address;
		public var phone:Phone;
		public var mobile:Phone;
		public var messages:Phone;
		
		public var created_at:Date;
		public var updated_at:Date;
		public var created_by:String;
		public var type:String;
	}
}