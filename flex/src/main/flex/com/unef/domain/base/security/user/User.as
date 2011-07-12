package com.unef.domain.base.security.user
{
	import com.unef.domain.business.person.Person;
	import com.unef.domain.model.BaseModel;
	import com.unef.domain.security.role.Role;
	
	import mx.collections.ArrayCollection;
	
	public class User extends Person
	{
		public var username:String;
		public var password:String;
		public var salt:String;
		[ArrayElementType("com.unef.domain.security.role.Role")]
		public var roles:ArrayCollection;
	}
}