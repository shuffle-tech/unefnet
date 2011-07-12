package com.unef.domain.base.event
{
	import com.unef.domain.base.model.BaseModel;
	
	import flash.events.Event;
	
	import mx.collections.ArrayCollection;
	
	public class BaseEvent extends Event
	{
		
		public static const REGISTER_SAVED:String="registerSaved";
		public static const REGISTER_UPDATED:String="registerUpdated";
		public static const REGISTER_DELETED:String="registerDeleted";
		public static const SHOW_REGISTER_DETAILS:String="showRegisterDetails";
		public static const REGISTERS_LOAD_COMPLETE:String="registersLoadComplete";
		public static const EDIT_ROW_START:String="editRowStart";
		public static const DELETE_ROW_REQUEST:String="deleteRowRequest";
		public static const SELECTED_REGISTER:String="selectedRegister";
		
		[ArrayElementType("com.unef.domain.model.BaseModel")]
		private var _resultList:ArrayCollection = new ArrayCollection();
		private var _row:BaseModel;
		
		public function BaseEvent(type:String,dataRow:BaseModel=null,dataList:ArrayCollection=null)
		{
			super(type,true);
			if (null != dataList){
				_resultList = dataList;
			}
			
			if (null != dataRow){
				_row = dataRow;
			}	
		}
		
		[Bindable]
		public function get resultList():ArrayCollection{
			return _resultList;
		}
		
		public function set resultList(list:ArrayCollection):void{
			_resultList = list;
		}
		
		[Bindable]
		public function get row():BaseModel{
			return _row;
		}
		
		public function set row(data:BaseModel):void{
			_row = data;
		}
		
		
		override public function clone():Event{
			return new BaseEvent(this.type,this._row,this._resultList);
		}
	}
}