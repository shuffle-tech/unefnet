package com.unef.domain.business.associated.type.crud
{
	import mx.collections.ArrayCollection;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	import mx.utils.StringUtil;
	
	import spark.components.VGroup;
	
	public class AssociatedTypeCrudBase extends VGroup
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
		
		protected function valueLabelFunction(item:Object, column:AdvancedDataGridColumn):String {
			return StringUtil.substitute("R${0}",item.value);
		}
		
		protected function discountValueLabelFunction(item:Object, column:AdvancedDataGridColumn):String {
			return StringUtil.substitute("R${0}",item.discount_value);
		}
		
	}
}