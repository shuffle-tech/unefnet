package com.unef.domain.business.billet
{
	import com.unef.domain.base.environment.desktop.IWindowHolder;
	import com.unef.domain.base.environment.workspace.IModuleLoader;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.ui.resource.UIResource;
	import com.unef.domain.business.billet.crud.BilletCrud;
	import com.unef.domain.business.billet.event.BilletEvent;
	import com.unef.util.Map;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexBitmap;
	import mx.events.FlexEvent;
	
	public class BilletUIResource extends BilletCrud implements IView, IWindowHolder
	{
		private var _controller:BilletController;
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners);
			addEventListener(FlexEvent.CREATION_COMPLETE,controller.findAll);
		}
		
		public function initializeListeners(event:FlexEvent):void{
			add.addEventListener(MouseEvent.CLICK, generateSingleBillet);
			create.generateBilletCommand.addEventListener(MouseEvent.CLICK, startBilletGeneration);
		}
		
		public function openWindow(resource:UIResource, parameters:Map = null):IModuleLoader{
			return null;
		}
		
		public function startBilletGeneration(event:MouseEvent):void{
			dispatchEvent(new BilletEvent(BilletEvent.START_BILLET_GENERATION));
		}
		
		public function generateSingleBillet(event:MouseEvent):void{
			dispatchEvent(new BilletEvent(BilletEvent.GENERATE_BILLET));
		}
		
		public function get controller():BilletController{
			if (null == _controller){
				_controller = new BilletController(this);
			}
			return _controller;
		}
	}
}