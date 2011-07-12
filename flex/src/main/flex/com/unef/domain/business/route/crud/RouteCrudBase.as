package com.unef.domain.business.route.crud
{
	import com.unef.domain.base.constants.Period;
	
	import mx.collections.ArrayCollection;
	import mx.controls.advancedDataGridClasses.AdvancedDataGridColumn;
	
	import spark.components.VGroup;
	
	public class RouteCrudBase extends VGroup
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
		
		protected function period(item:Object, column:AdvancedDataGridColumn):String {
			var literal:String=Period.NIGHT_LITERAL;
			switch(item.period)
			{
				case Period.MORNING:
				{
					literal = Period.MORNING_LITERAL; 
					break;
				}
				case Period.AFTERNOON:
				{
					literal = Period.AFTERNOON_LITERAL; 
					break;
				}
				case Period.NIGHT:
				{
					literal = Period.NIGHT_LITERAL; 
					break;
				}
				
				default:
				{
					literal = Period.NIGHT_LITERAL;
					break;
				}
			}
			return literal;
		}
		
		
		protected function departure_schedule(item:Object, column:AdvancedDataGridColumn):String {
			return String(item.departure_schedule).substr(0,5);
		}
		
		protected function return_schedule(item:Object, column:AdvancedDataGridColumn):String {
			return String(item.return_schedule).substr(0,5);
		}
	}
}