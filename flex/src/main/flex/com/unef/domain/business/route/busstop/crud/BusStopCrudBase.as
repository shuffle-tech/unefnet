package com.unef.domain.business.route.busstop.crud
{
	import com.unef.domain.base.interfaces.IView;
	
	import mx.collections.ArrayCollection;
	
	import spark.components.VGroup;
	
	public class BusStopCrudBase extends VGroup implements IView
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