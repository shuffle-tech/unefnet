package com.unef.security.auth
{
	import com.unef.domain.base.remote.RemoteObjectImpl;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class LoginService extends EventDispatcher
	{
		public static const SERVICE_NAME:String = "myService";
		public static const AUTH_OPERATION_NAME:String = "auth";
		public static const IS_LOGGED_IN_OPERATION_NAME:String = "isLoggedIn";
		public static const LOGOUT_OPERATION_NAME:String = "logout";
		
		private var _service:RemoteObjectImpl;
		private var remote:RemoteObject = new RemoteObject();
		
		
		public function LoginService(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		protected function get service():RemoteObjectImpl{
			if(null == _service){
				_service = new RemoteObjectImpl(SERVICE_NAME);
				_service.addEventListener(FaultEvent.FAULT,faultEventHandler);
			}
			return _service;
		}
		
		public function isLoggedInCheck():void{
			
			try
			{
				remote.destination = SERVICE_NAME;
				remote.source = "com.unef.business.MyServiceImpl";
				remote.isLoggedIn.addEventListener(ResultEvent.RESULT,isLoggedInCheckResultHandler);
				remote.isLoggedIn.addEventListener(FaultEvent.FAULT,faultEventHandler);
				remote.isLoggedIn();
			} 
			catch(error:Error) 
			{
				Alert.show("ERRO : " + error.message);
					
			}
			
//			service.setResultFunction(isLoggedInCheckResultHandler);
//			service.getOperation(IS_LOGGED_IN_OPERATION_NAME).send();
		}
		
		public function auth(uname:String,upass:String):void{
			service.setResultFunction(authEventHandler);
			var login:Login = new Login();
			login.password = upass;
			login.username = uname;
			service.getOperation(AUTH_OPERATION_NAME).send(login);
		}
		
		public function logout():void{
			service.setResultFunction(logoutResultHandler);
			service.getOperation(LOGOUT_OPERATION_NAME).send();
		}
		
		public function logoutResultHandler(event:ResultEvent):void{
			dispatchEvent(new AuthenticationEvent(AuthenticationEvent.LOGOUT_SUCCESSFUL));
		}
		
		public function isLoggedInCheckResultHandler(event:ResultEvent):void{
			
			var authResult:AuthenticationEvent = new AuthenticationEvent(AuthenticationEvent.ALREADY_AUTHENTICATED);
			authResult.isAuthenticated = event.result as Boolean;
			dispatchEvent(authResult);
		}
		
		public function isLoggedInResultHandler(event:ResultEvent):void{
			if (event.result as Boolean){
				
			}else{
				
			}
		}
		
		public function authEventHandler(event:ResultEvent):void{
			var result:Boolean = event.result as Boolean;
			if (result){
				dispatchEvent(new AuthenticationEvent(AuthenticationEvent.AUTHENTICATION_SUCESSFUL));
			}else{
				dispatchEvent(new AuthenticationEvent(AuthenticationEvent.AUTHENTICATION_FAIL));
			}
		}
		
		public function resultEventHandler(event:ResultEvent):void{
			Alert.show("Result Event handler");
		}
		
		public function loginSuccessfulResultHandler(event:ResultEvent):void{
			
		}
		
		public function faultEventHandler(event:FaultEvent):void{
			Alert.show("ERRO: " + event.fault.getStackTrace(),"Falha na authenticação");
		}
	}
}