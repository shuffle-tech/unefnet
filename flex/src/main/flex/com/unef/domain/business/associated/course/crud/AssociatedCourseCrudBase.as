package com.unef.domain.business.associated.course.crud
{
	import mx.collections.ArrayCollection;
	
	import spark.components.VGroup;
	
	public class AssociatedCourseCrudBase extends VGroup
	{
		private var _dataProvider:ArrayCollection;
		private var _expirationDays:ArrayCollection;
		
		[Bindable]
		public function get dataProvider():ArrayCollection
		{
			return _dataProvider;
		}
		
		public function set dataProvider(value:ArrayCollection):void
		{
			_dataProvider = value;
		}
		
		public function get expirationDays():ArrayCollection{
			if (null == _expirationDays){
				_expirationDays = new ArrayCollection();
			}
			for (var i:int=1;i<=31;i++){
				_expirationDays.addItem(i);
			}
			return _expirationDays;
		}
	}
}