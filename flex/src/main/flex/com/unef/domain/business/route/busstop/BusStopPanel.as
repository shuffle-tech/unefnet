package com.unef.domain.business.route.busstop
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	public class BusStopPanel extends BusStopPanelTemplate implements IView
	{
		private var _controller:BusStopController;
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners,false,0,true);
			addEventListener(FlexEvent.CREATION_COMPLETE,controller.findAll,false,0,true);
		}
		
		public function get controller():BusStopController{
			if (null  == _controller){
				_controller = new BusStopController(this);				
			}
			return _controller;
		} 
		
		protected function initializeListeners(event:FlexEvent):void{	
			initializeRendererListeners(event);
			initializeTemplateListeners(event);
			
		}
		
		protected function initializeRendererListeners(event:FlexEvent):void{
			addEventListener(BaseEvent.EDIT_ROW_START,controller.editRow);
			addEventListener(BaseEvent.DELETE_ROW_REQUEST,controller.removeConfirmation);
		}
		
		protected function initializeTemplateListeners(event:FlexEvent):void{
			template.create.saveCommand.addEventListener(MouseEvent.CLICK,controller.save);
			template.edit.saveCommand.addEventListener(MouseEvent.CLICK,controller.update);
			template.create.cancel.addEventListener(MouseEvent.CLICK,controller.cancel);
			template.edit.cancel.addEventListener(MouseEvent.CLICK,controller.cancel);
			template.add.addEventListener(MouseEvent.CLICK,add);
		}
		
		protected function add(event:MouseEvent):void{
			template.stack.selectedChild = template.addBusStop;
		}
	}
}