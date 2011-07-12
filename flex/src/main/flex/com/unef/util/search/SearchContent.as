package com.unef.util.search
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	import flash.utils.describeType;
	
	import mx.collections.ArrayCollection;
	import mx.collections.ICollectionView;
	import mx.controls.Alert;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.controls.advancedDataGridClasses.MXAdvancedDataGridItemRenderer;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.core.ClassFactory;
	import mx.core.IFactory;
	import mx.events.CloseEvent;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;

	/**
	 * 
	 * @author John
	 * 
	 */
	public class SearchContent extends SearchComponentTemplate
	{
		
		public static const DEFAULT_COLUMN_WIDTH:Number = 100;
		public static const NOT_FOUND:Number = -1;
		
		[Bindable]		
		private var _columns:Array = new Array();
		[Bindable]
		private var _dataProvider:ArrayCollection = new ArrayCollection();
		/**
		 * 
		 */		
		private var _caller:DisplayObject;
		private var _callback:Function;
		 
		/**
		 * 
		 * 
		 */
		public function SearchContent()
		{
			super();
		}
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners);
			addEventListener(FlexEvent.CREATION_COMPLETE,setUpApplication);
			addEventListener(KeyboardEvent.KEY_DOWN,closedByKey);
		}
		
		protected function initializeListeners(event:FlexEvent):void{
			addEventListener(FlexEvent.CREATION_COMPLETE, setUpApplication);		
			addEventListener(MouseEvent.DOUBLE_CLICK, selectedItem);		
			addEventListener(CloseEvent.CLOSE,close);			
			conformCommand.addEventListener(MouseEvent.CLICK, selectedItem);			
			cancelCommand.addEventListener(MouseEvent.CLICK,closePopUp);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function setUpApplication(event:FlexEvent):void{		
			filter.text.addEventListener(Event.CHANGE, doFilter);
			datagrid.columns = _columns;
		} 
		
		/**
		 * 
		 * @param headerText
		 * @param columnName
		 * @param width
		 * 
		 */
		public function addColumn(headerText:String, columnName:String, width:Number=DEFAULT_COLUMN_WIDTH,renderer:Class=null):void{
			var column:AdvancedDataGridColumn = new AdvancedDataGridColumn(columnName);
			column.headerText = headerText;
			column.width = width;
			if (null != renderer){				
				column.itemRenderer = new ClassFactory(renderer);
			}
			_columns.push(column);			
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get dataProvider():ArrayCollection{
			return datagrid.dataProvider as ArrayCollection;
		}
		
		/**
		 * 
		 * @param data
		 * 
		 */
		public function set dataProvider(data:ArrayCollection):void{
			datagrid.dataProvider = data;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get caller():DisplayObject{
			return _caller;
		}
		
		/**
		 * 
		 * @param data
		 * 
		 */
		public function set caller(data:DisplayObject):void{
			_caller = data;
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get callback():Function{
			return _callback;
		}
		
		/**
		 * 
		 * @param data
		 * 
		 */
		public function set callback(data:Function):void{
			_callback = data;
		}
		
		/**
		 * 
		 * 
		 */
		public function show():void{
			PopUpManager.addPopUp(this,caller,true);
			PopUpManager.centerPopUp(this);
		}
				
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function selectedItem(event:MouseEvent):void{
			var selectedItems:Array = new Array();
			for each(var item:Object in datagrid.dataProvider){
				if (item.selected){
					selectedItems.push(item);
				}
			}
			
			if (selectedItems.length != 0){
				callback(selectedItems);
			}else{
				callback(datagrid.selectedItem)
			}
			
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function selectedItems(event:MouseEvent):void{
			callback(datagrid.selectedItems);
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function closePopUp(event:MouseEvent):void{
			dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
		}
		
		protected function closedByKey(event:KeyboardEvent):void{
			if (event.keyCode == Keyboard.ESCAPE){
				dispatchEvent(new CloseEvent(CloseEvent.CLOSE));
			}
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function close(event:CloseEvent):void{		
			PopUpManager.removePopUp(this);
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function doFilter(event:Event):void{
			datagrid.dataProvider.filterFunction = filterResults;
			datagrid.dataProvider.refresh();
		}
		
		/**
		 * 
		 * @param item
		 * @return 
		 * 
		 */
		protected function filterResults(item:Object):Boolean{			
			var key:String = filter.text.text as String;
			key = key.toLowerCase();
			
			var classInfo:XML = describeType(item);
			var found:Boolean = false
			for each(var node:XML in classInfo..accessor){			
				try
				{
					if (item[node.@name].toString().toLocaleLowerCase().search(key) != NOT_FOUND){
						found = true;
					}else{
						continue;
					}
				} 
				catch(error:Error) 
				{
					continue;
				}
			}
			return found;
		}
		
		
	}
}