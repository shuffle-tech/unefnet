package com.unef.domain.business.associated
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.events.SuperPanelEvent;
	
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.events.FlexEvent;
	
	import nl.wv.extenders.panel.SuperPanel;

	public class AssociatedPanel extends AssociatedPanelTemplate implements IView
	{
		private var _controller:AssociatedController;
		
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners,false,0,true);
			addEventListener(FlexEvent.CREATION_COMPLETE,controller.findAll,false,0,true);
		}
		
		public function get controller():AssociatedController{
			if (null  == _controller){
				_controller = new AssociatedController(this);				
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
//			addEventListener(BaseEvent.SHOW_REGISTER_DETAILS,controller.detailRow);			
		}
		
		protected function initializeTemplateListeners(event:FlexEvent):void{
			template.create.saveCommand.addEventListener(MouseEvent.CLICK,controller.save);
//			template.edit.saveCommand.addEventListener(MouseEvent.CLICK,controller.update);
//			template.create.cancel.addEventListener(MouseEvent.CLICK,controller.cancel);
//			template.details.backCommand.addEventListener(MouseEvent.CLICK,controller.cancel);
//			template.edit.cancel.addEventListener(MouseEvent.CLICK,controller.cancel);
			template.add.addEventListener(MouseEvent.CLICK,add);
			template.create.nextCommand.addEventListener(MouseEvent.CLICK,next);
		}
		
		protected function add(event:MouseEvent):void{
			normalMaxClickHandler();
			template.stack.selectedChild = template.addRegister;
		}
		
		protected function next(event:MouseEvent):void{
			if (template.create.stack.selectedChild == template.create.addAssociated){
				template.create.stack.selectedChild = template.create.addAssociatedCourse;
			}else if (template.create.stack.selectedChild == template.create.addAssociatedCourse){
				template.create.stack.selectedChild = template.create.addResponsible;
			}
		}
	}
}