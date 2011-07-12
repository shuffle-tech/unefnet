package com.unef.util.search.component
{
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;

	public class SearchButtonComponent extends SearchButtonComponentTemplate
	{
		protected var _window:IFlexDisplayObject;
		protected var _caller:DisplayObject;
		
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,setUpApplication);
		}
		
		public function setUpApplication(event:FlexEvent):void{
			openWindowCommand.addEventListener(MouseEvent.CLICK, openWindow);			
		} 
		
		protected function openWindow(event:MouseEvent):void{
			PopUpManager.addPopUp(window,caller,true);
			PopUpManager.centerPopUp(window);
		}
		
		public function get window():IFlexDisplayObject{
			return _window;
		}
		
		public function get caller():DisplayObject{
			if (null == _caller){
				return null;
			}
			return _caller;
		}
		
		public function set caller(data:DisplayObject):void{
			_caller = data;
		}
	}
}