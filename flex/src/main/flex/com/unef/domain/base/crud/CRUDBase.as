package com.unef.domain.base.crud
{
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.business.shifts.Shift;
	
	import mx.collections.ArrayCollection;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	import spark.components.NavigatorContent;
	import spark.components.VGroup;
	
	public class CRUDBase extends VGroup implements IView
	{
		private static const ADD_REGISTER_CHILD_NAME:String = "addRegister"; 
		private static const EDIT_REGISTER_CHILD_NAME:String = "editRegister"; 
		
		private var _dataProvider:ArrayCollection;
		private var _item_id:int;
		private var _columns:Array;
		private var _addRegisterGroup:Group;
		private var _editRegisterGroup:Group;
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,creationCompleteHandler);
		}
		
		protected function creationCompleteHandler(event:FlexEvent):void{
			try
			{	
				NavigatorContent(this[ADD_REGISTER_CHILD_NAME]).addElement(addRegisterGroup);
				if (editRegisterGroup){
					NavigatorContent(this[EDIT_REGISTER_CHILD_NAME]).addElement(editRegisterGroup);
				}
			} 
			catch(error:Error) 
			{
				throw new Error(error);
			}
		}
		
		[Bindable]
		public function get dataProvider():ArrayCollection
		{
			if(null == _dataProvider){
				_dataProvider = new ArrayCollection();
			}
			var first:Shift = new Shift();
			first.description = "first";
			_dataProvider.addItem(first);
			return _dataProvider;
		}
		
		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
		}

		[Bindable]
		public function get columns():Array
		{
			if (null == _columns){
				_columns = new Array();
			}
			return _columns;
		}

		public function set columns(value:Array):void
		{
			_columns = value;
		}
		[Bindable]
		public function get addRegisterGroup():Group
		{
			return _addRegisterGroup;
		}

		public function set addRegisterGroup(value:Group):void
		{
			_addRegisterGroup = value;
		}
		[Bindable]
		public function get editRegisterGroup():Group
		{
			return _editRegisterGroup;
		}

		public function set editRegisterGroup(value:Group):void
		{
			_editRegisterGroup = value;
		}


	}
}