package com.unef.domain.business.shifts.crud
{
	import mx.collections.ArrayCollection;
	
	import spark.components.VGroup;
	
	public class ShiftCrudBase extends VGroup
	{
		private var _dataProvider:ArrayCollection;
		
		[Bindable]
		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}
		
		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
		}
		
		
		
	}
}