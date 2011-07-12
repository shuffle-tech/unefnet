package com.unef.domain.business.institutions
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	
	import flash.events.MouseEvent;
	import flash.utils.flash_proxy;
	
	import mx.events.FlexEvent;

	public class InstitutionPanel extends InstitutionPanelTemplate implements IView
	{
		private var _controller:InstitutionController;
		
		public function InstitutionPanel()
		{
			super();			
		}
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners,false,0,true);
			addEventListener(FlexEvent.CREATION_COMPLETE,controller.findAll,false,0,true);
		}
		
		public function get controller():InstitutionController{
			if (null  == _controller){
				_controller = new InstitutionController(this);				
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
			addEventListener(BaseEvent.SHOW_REGISTER_DETAILS,controller.detailRow);			
		}
		
		protected function initializeTemplateListeners(event:FlexEvent):void{
			template.create.saveCommand.addEventListener(MouseEvent.CLICK,controller.save);
			template.edit.saveCommand.addEventListener(MouseEvent.CLICK,controller.update);
			template.create.cancelCommand.addEventListener(MouseEvent.CLICK,controller.cancel);
			template.details.backCommand.addEventListener(MouseEvent.CLICK,controller.cancel);
			template.edit.cancelCommand.addEventListener(MouseEvent.CLICK,controller.cancel);
			template.add.addEventListener(MouseEvent.CLICK,add);
		}
		
		protected function add(event:MouseEvent):void{
			template.stack.selectedChild = template.addInstitution;
		}
	}
}