package com.unef.domain.business.associated
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.business.associated.crud.AssociatedCreateEditTemplate;
	import com.unef.domain.business.associated.crud.AssociatedCrudTemplate;
	import com.unef.domain.business.associated.crud.AssociatedFormTemplate;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public class AssociatedUIResource extends AssociatedCrudTemplate implements IView
	{
		private var _controller:AssociatedController;
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,controller.findAll);
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners);
		}
		
		public function initializeListeners(event:FlexEvent):void{
			add.addEventListener(MouseEvent.CLICK, addCommand);
			create.saveCommand.addEventListener(MouseEvent.CLICK, saveCommand);
			create.nextCommand.addEventListener(MouseEvent.CLICK, nextCommand);
			create.prevCommand.addEventListener(MouseEvent.CLICK, prevCommand);
			create.cancelCommand.addEventListener(MouseEvent.CLICK,cancelCommand);
		}
		
		public function detailCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.DETAIL));
		}
		
		public function editCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.EDIT));	
		}
		
		public function remove(event:MouseEvent):void{
			// just for admin, in case of erros on the register
			dispatchEvent(new AssociatedEvent(AssociatedEvent.REMOVE));
		}
		
		public function annulContract(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.ANNUL_CONTRACT));
		}
		
		public function addCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.ADD));
		}
		
		public function saveCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.SAVE));
		}
		
		public function nextCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.NEXT));
		}
		
		public function prevCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.PREV));
		}
		
		public function cancelCommand(event:MouseEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.CANCEL));
		}
		
		public function findAllCommand(event:FlexEvent):void{
			dispatchEvent(new AssociatedEvent(AssociatedEvent.FIND_ALL));
		}
		
		public function get controller():AssociatedController{
			if (null == _controller){
				_controller = new AssociatedController(this);
			}
			return _controller;
		}
	}
}