package com.unef.ui.components.application
{
	import com.unef.base.model.UserData;
	import com.unef.base.services.SecurityService;
	import com.unef.domain.base.security.user.User;
	import com.unef.security.auth.AuthenticationEvent;
	import com.unef.security.auth.Login;
	import com.unef.security.auth.LoginAuthentication;
	import com.unef.security.auth.LoginService;
	import com.unef.ui.components.desktop.Desktop;
	
	import flash.events.MouseEvent;
	import flash.system.Security;
	
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.controls.Label;
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	
	public class IndexApplication extends Application
	{
		private var _service:LoginService;
		private var _securityService:SecurityService;
		private var _desktop:Desktop;
		private var _authentication:LoginAuthentication;
		private var _welcome:VBox;
		
		public function IndexApplication()
		{
			super();
		}
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			super.addEventListener(FlexEvent.CREATION_COMPLETE,crossdomain);
			addEventListener(FlexEvent.CREATION_COMPLETE,isLoggedInCheck);
			addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
			service.addEventListener(AuthenticationEvent.ALREADY_AUTHENTICATED,isLoggedInCheckResult);
		}
		
		protected function isLoggedInCheck(event:FlexEvent):void{
//			service.isLoggedInCheck();
//			Alert.show("IsLoggedIn Autenticado " + UserData.getInstance().authenticated);
			isUserLoggedInCheckResult(UserData.getInstance().authenticated);
		}
		
		protected function isUserLoggedInCheckResult(authenticated:Boolean):void{
			if(authenticated){
				desktopBuilder();
			}else{
				askForLogin();
			}
		}
		
		protected function isLoggedInCheckResult(event:AuthenticationEvent):void{
			if(event.isAuthenticated){
				desktopBuilder();
			}else{
				askForLogin();
			}
		}
		
		private function crossdomain(event:FlexEvent):void {
			//Security.allowDomain("http://unefnet:10088","http://www.unef.com.br");	
			//Security.loadPolicyFile("http://www.unef.com.br/Crossdomain.xml");
		} 
		
		public function checkAuthStatus():void{
			Alert.show("Check Status -> Autenticado " + UserData.getInstance().authenticated);
			//service.isLoggedInCheck();
		}
		
		public function get service():LoginService{
			if(null == _securityService){
				_service = new LoginService();
			}
			return _service; 
		}
		
		public function set service(service:LoginService):void{
			_service = service;
		}
		
		public function get securityService():SecurityService{
			if(null == _securityService){
				_securityService = new SecurityService();
			}
			return _securityService; 
		}
		
		public function set securityService(service:SecurityService):void{
			_securityService = service;
		}
		
		protected function desktopBuilder():void{
			_desktop = new Desktop();
			_desktop.percentWidth = 100;
			_desktop.percentHeight = 100;
			_desktop.addEventListener(FlexEvent.CREATION_COMPLETE,desktopCreationCompleteHandler);
			addElement(_desktop);
		}
		
		protected function desktopCreationCompleteHandler(event:FlexEvent):void{
			_desktop.logout.addEventListener(MouseEvent.CLICK,logout);
			_desktop.organize.addEventListener(MouseEvent.CLICK,organize);
		}
		
		protected function askForLogin():void{
			_authentication = new LoginAuthentication();
			_authentication.horizontalCenter = 0;
			_authentication.verticalCenter = 0;
			_authentication.addEventListener(AuthenticationEvent.AUTHENTICATION_SUCESSFUL,authenticationSuccessful);
			_authentication.addEventListener(AuthenticationEvent.AUTHENTICATION_FAIL,authenticationFail);
				
			addElement(_authentication);
		}
		
		protected function authenticationSuccessful(event:AuthenticationEvent):void{
			removeAllElements();
			desktopBuilder();
		}
		
		protected function authenticationFail(event:AuthenticationEvent):void{
			Alert.show("Usuário ou Senha Inválidos!","Falha na autenticação");
		}
		
		protected function creationCompleteHandler(event:FlexEvent):void{
		}
		
		protected function remove(evt:FlexEvent):void{
		}
		
		protected function logout(event:MouseEvent):void{
			service.addEventListener(AuthenticationEvent.LOGOUT_SUCCESSFUL,logoutHandler);
			service.logout();
		}
		
		protected function logoutHandler(event:AuthenticationEvent):void{
			removeAllElements();
			askForLogin();
		}
		
		protected function organize(event:MouseEvent):void{
			_desktop.dashboard.container.organize();
		}
		
	}
}