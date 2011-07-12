package com.unef.domain.base.controller
{
	import com.datasul.framework.ui.progressmonitor.SimpleProgressMonitor;
	import com.unef.domain.base.interfaces.IController;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.service.BaseService;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	
	public class BaseController extends EventDispatcher implements IController
	{
		private var _model:IModel;
		private var _service:BaseService;
		
		private var _progressMonitor:SimpleProgressMonitor;
		
		protected var _view:IView;
		
		
		public function BaseController(view:IView)
		{
			super();
			_view = view;
			
			DisplayObject(_view).addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners,false,0,true);
			DisplayObject(_view).addEventListener(FlexEvent.CREATION_COMPLETE,setUpApplication,false,0,true);
		}
		
		protected function showProgressMonitor():void{
			if(null == _progressMonitor){
				_progressMonitor = new SimpleProgressMonitor();
				_progressMonitor.animationMessage = "Aguarde...";
				_progressMonitor.lockParentOnly = true;
				_progressMonitor.modal = true;
				_progressMonitor.removeLoaderBorderAndBackground = true;
				_progressMonitor.loaderAnimationColor = 0xFFFFFF;
				_progressMonitor.modalBackgroundColor = 0x000000;
			}
			_progressMonitor.parent = _view as UIComponent;
			_progressMonitor.show()
		}
		
		protected function hideProgressMonitor():void{
			if (_progressMonitor){
				_progressMonitor.hide();
			}
		}
		
		
		public function setUpApplication(event:FlexEvent):void
		{
			
		}
		
		public function initializeListeners(event:FlexEvent):void
		{
			
		}
		
		public function get model():IModel
		{
			return null;
		}
		
		public function set model(model:IModel):void
		{
			
		}
		
		public function get service():BaseService
		{
			return null;
		}
		
		public function set service(service:BaseService):void
		{
			
		}
		
		
	}
}