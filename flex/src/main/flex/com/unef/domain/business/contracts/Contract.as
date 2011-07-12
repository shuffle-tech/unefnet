package com.unef.domain.business.contracts
{
	import com.unef.domain.base.model.BaseModel;
	
	[Bindable]
	[RemoteClass(alias="Contract")]
	public class Contract extends BaseModel
	{
		private var _path:String;
		private var _description:String;

		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			_path = value;
		}

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}


	}
}