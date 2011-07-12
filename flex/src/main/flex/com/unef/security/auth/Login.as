package com.unef.security.auth
{
	
	
	[Bindable]
	[RemoteClass(alias="LoginAuth")]
	public class Login 
	{
		public var username:String;
		public var password:String;
		
		public function Login():void{
		}
		
	}
}