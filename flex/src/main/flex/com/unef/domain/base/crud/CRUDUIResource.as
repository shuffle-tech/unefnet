package com.unef.domain.base.crud
{
	import com.unef.domain.base.event.BaseEvent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class CRUDUIResource extends CRUDTemplate
	{
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners);
		}
		
		protected function initializeListeners(event:FlexEvent):void{
			add.addEventListener(MouseEvent.CLICK,addRegisterHandler);
			addEventListener(BaseEvent.EDIT_ROW_START,propagateEditRowEvent);
			addEventListener(BaseEvent.DELETE_ROW_REQUEST,propagateRemoveRowEvent);
		}
		
		protected function addRegisterHandler(event:MouseEvent):void{
			stack.selectedChild = addRegister;
		}
		
		protected function editRegisterHandler(event:MouseEvent):void{
			stack.selectedChild = editRegister;
		}
		
		protected function propagateEditRowEvent(event:BaseEvent):void{
			dispatchEvent(event);
		}
		
		protected function propagateRemoveRowEvent(event:BaseEvent):void{
			dispatchEvent(event);
		}
	}
}