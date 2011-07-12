package com.unef.domain.business.course.crud
{
	import mx.collections.ArrayCollection;
	
	import spark.components.VGroup;
	
	public class CourseCrudBase extends VGroup
	{
		private var _dataProvider:ArrayCollection;
		
		public function CourseCrudBase()
		{
			super();
		}
		
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