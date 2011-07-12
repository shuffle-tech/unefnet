package com.unef.domain.business.route.busstop
{
	import com.unef.domain.base.model.BaseModel;
	
	[Bindable]
	[RemoteClass(alias="BusStop")]
	public class BusStop extends BaseModel
	{
		private var _neighborhood:String;
		private var _city:String;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;
		
		
		public function get neighborhood():String
		{
			return _neighborhood;
		}

		public function set neighborhood(value:String):void
		{
			_neighborhood = value;
		}

		public function get city():String
		{
			return _city;
		}

		public function set city(value:String):void
		{
			_city = value;
		}

		public function get created_at():Date
		{
			return _created_at;
		}

		public function set created_at(value:Date):void
		{
			_created_at = value;
		}

		public function get updated_at():Date
		{
			return _updated_at;
		}

		public function set updated_at(value:Date):void
		{
			_updated_at = value;
		}

		public function get created_by():String
		{
			return _created_by;
		}

		public function set created_by(value:String):void
		{
			_created_by = value;
		}


	}
}