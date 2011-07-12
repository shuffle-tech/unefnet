package com.unef.domain.business.institutions.crud
{
	import mx.collections.ArrayCollection;
	
	import spark.components.VGroup;
	
	public class InstitutionCrudBase extends VGroup
	{
		private var _dataProvider:ArrayCollection;
		
		public function InstitutionCrudBase()
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