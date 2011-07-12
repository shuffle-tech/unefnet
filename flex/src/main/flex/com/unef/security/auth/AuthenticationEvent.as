package com.unef.security.auth
{
	import flash.events.Event;
	
	public class AuthenticationEvent extends Event
	{
		public static const ALREADY_AUTHENTICATED:String = "alreadyAuthenticated";
		public static const AUTHENTICATION_SUCESSFUL:String = "authenticationSuccessful";
		public static const AUTHENTICATION_FAIL:String = "authenticationFail";
		public static const DO_LOGIN:String ="doLogin";
		public static const DO_LOGOUT:String ="doLogout";
		public static const LOGOUT_SUCCESSFUL:String ="logoutSuccessful";
		public static const LOGOUT_FAIL:String ="logoutFail";
		
		private var _isAuthenticated:Boolean;
		
		public function AuthenticationEvent(type:String)
		{
			super(type);
		}

		public function get isAuthenticated():Boolean
		{
			return _isAuthenticated;
		}

		public function set isAuthenticated(value:Boolean):void
		{
			_isAuthenticated = value;
		}
		
		override public function clone():Event{
			return new AuthenticationEvent(type);
		}

	}
}