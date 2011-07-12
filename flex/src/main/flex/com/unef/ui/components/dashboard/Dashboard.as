package com.unef.ui.components.dashboard
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.events.ChildExistenceChangedEvent;
	import mx.events.FlexEvent;

	public class Dashboard extends DashboardTemplate
	{
		public function Dashboard()
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE, initialOrganize);
		}
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE, initialOrganize);
//			container.addEventListener(Event.ADDED,organizePanels);
//			container.addEventListener(Event.REMOVED,organizePanels);
		}
		
		protected function organizePanels(event:Event):void{
			container.organize();
		}
		
		public function initialOrganize(event:FlexEvent):void{
			container.organize();
		}
		
		public function organize(event:MouseEvent):void{
			container.organize();
		}
	}
}