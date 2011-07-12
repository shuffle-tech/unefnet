package com.unef.security.auth
{
	import com.unef.base.event.AuthenticationFailureEvent;
	import com.unef.base.services.SecurityService;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.utils.StringUtil;

	public class LoginAuthentication extends LoginTemplate
	{
		
		private var _service:SecurityService = new SecurityService();
		
		override protected function initializationComplete():void{
			addEventListener(KeyboardEvent.KEY_DOWN,auth);
			submitButton.addEventListener(MouseEvent.CLICK,auth);
			//service.addEventListener(AuthenticationEvent.AUTHENTICATION_SUCESSFUL,authenticationSuccessfulHander);
			
		}
		
		protected function auth(event:Event):void{
			try{
				if (KeyboardEvent(event).keyCode != Keyboard.ENTER){
					return;
				}
			}catch(error:Error){
				
			}
			
			if (StringUtil.trim(uname.text).length != 0 && StringUtil.trim(upass.text).length != 0){
				Alert.show("Sending Authentication");
				Application.application.addEventListener(AuthenticationFailureEvent.AUTHENTICATION_FAILURE,authenticationFailfulHander);
				service.authenticatePrincipal(uname.text,upass.text);
			}
		}

		public function get service():SecurityService
		{
			if (null == _service){
				_service = new SecurityService();
			}
			return _service;
		}

		public function set service(value:SecurityService):void
		{
			_service = value;
		}
		
		protected function authenticationSuccessfulHander(event:AuthenticationEvent):void{
			dispatchEvent(new AuthenticationEvent(AuthenticationEvent.AUTHENTICATION_SUCESSFUL));
		}
		
		protected function authenticationFailfulHander(event:AuthenticationEvent):void{
			dispatchEvent(new AuthenticationEvent(AuthenticationEvent.AUTHENTICATION_FAIL));
		}
		
		

	}
}