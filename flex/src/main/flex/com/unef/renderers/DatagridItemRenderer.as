package com.unef.renderers
{
	import flash.events.MouseEvent;
	
	import mx.events.FlexEvent;

	public interface DatagridItemRenderer
	{
		function editRow(event:MouseEvent):void;
		function removeRow(event:MouseEvent):void;
		function detailRow(event:MouseEvent):void;
		function initializeListeners(event:FlexEvent):void;
	}
}