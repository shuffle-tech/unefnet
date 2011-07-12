package com.unef.domain.business.route.busstop
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	
	import mx.collections.ArrayCollection;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	public class BusStopPanelBase extends SuperPanel implements IView
	{
		public static const TITLE:String = "Pontos de Embarque e Desembarque";
		
		override public function get title():String{
			return TITLE;
		}
		
	}
}