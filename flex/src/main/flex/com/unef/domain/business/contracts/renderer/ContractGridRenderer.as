package com.unef.domain.business.contracts.renderer
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.contracts.event.ContractEvent;
	import com.unef.domain.business.institutions.event.InstitutionEvent;
	import com.unef.renderers.DatagridItemRenderer;
	import com.unef.renderers.DatagridOperationsRendererTemplate;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	[Event(name="editRowStart", type="com.unef.domain.base.event.BaseEvent")]
	public class ContractGridRenderer extends DatagridOperationsRendererTemplate implements DatagridItemRenderer
	{
		public function ContractGridRenderer()
		{
			super();
		}		

		override protected function initializationComplete():void{
			addEventListener(FlexEvent.CREATION_COMPLETE, initializeListeners);
			addEventListener(FlexEvent.CREATION_COMPLETE, actionsVisibility);
		}
		
		public function initializeListeners(event:FlexEvent):void{
			edit.addEventListener(MouseEvent.CLICK, editRow);
			remove.addEventListener(MouseEvent.CLICK, removeRow);	
		}
		
		protected function actionsVisibility(event:FlexEvent):void{
			detailActionVisibility = false;
		}
		
		protected function set detailActionVisibility(visibility:Boolean):void{
			detail.visible = visibility;
			detail.includeInLayout = visibility;
		}
		
		public function editRow(event:MouseEvent):void
		{
			var rowEvent:InstitutionEvent = new InstitutionEvent(BaseEvent.EDIT_ROW_START);
			rowEvent.row = data as BaseModel;
			owner.dispatchEvent(rowEvent);			
		}
		
		public function removeRow(event:MouseEvent):void
		{
			var rowEvent:InstitutionEvent = new InstitutionEvent(BaseEvent.DELETE_ROW_REQUEST);
			rowEvent.row = data as BaseModel;
			owner.dispatchEvent(rowEvent);
		}
		
		public function detailRow(event:MouseEvent):void
		{
			var rowEvent:ContractEvent = new ContractEvent(BaseEvent.SHOW_REGISTER_DETAILS);
			rowEvent.row = data as BaseModel;
			owner.dispatchEvent(rowEvent);
		}
		
		public function doRemove():void{
			
		}
		
	}
}