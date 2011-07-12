package com.unef.domain.business.payment.crud
{
	import mx.collections.ArrayCollection;
	
	import spark.components.VGroup;
	
	public class PaymentTypeCrudBase extends VGroup
	{
		private var _dataProvider:ArrayCollection;
		
		public function PaymentTypeCrudBase()
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