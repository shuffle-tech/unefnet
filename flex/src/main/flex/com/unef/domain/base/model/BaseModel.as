package com.unef.domain.base.model
{
	public class BaseModel implements IModel
	{
		private var _id:int;
		private var _selected:Boolean;
		
		public function BaseModel()
		{
			super();
		}
		
		public function get id():int{
			return _id;
		}
		
		public function set id(value:int):void{
			_id = value;
		}

		public function get selected():Boolean
		{
			return _selected;
		}

		public function set selected(value:Boolean):void
		{
			_selected = value;
		}

	}
}