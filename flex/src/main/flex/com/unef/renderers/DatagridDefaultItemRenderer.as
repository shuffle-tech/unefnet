package com.unef.renderers
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.institutions.event.InstitutionEvent;
	
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;
	
	[Event(name="editRowStart", type="com.unef.domain.events.BaseEvent")]
	public class DatagridDefaultItemRenderer extends DatagridOperationsRendererTemplate implements DatagridItemRenderer
	{
		public function DatagridDefaultItemRenderer()
		{
			super();
		}		
		
		override protected function initializationComplete():void{
			addEventListener(FlexEvent.CREATION_COMPLETE, initializeListeners);
		}
		
		public function initializeListeners(event:FlexEvent):void{
			edit.addEventListener(MouseEvent.CLICK, editRow);
			remove.addEventListener(MouseEvent.CLICK, removeRow);
			detail.addEventListener(MouseEvent.CLICK, detailRow);
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
			var rowEvent:InstitutionEvent = new InstitutionEvent(BaseEvent.SHOW_REGISTER_DETAILS);
			rowEvent.row = data as BaseModel;
			owner.dispatchEvent(rowEvent);
		}
		
		public function doRemove():void{
			
		}
		
	}
}