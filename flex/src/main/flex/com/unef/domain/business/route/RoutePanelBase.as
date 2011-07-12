package com.unef.domain.business.route
{
	import com.unef.domain.base.interfaces.IView;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	public class RoutePanelBase extends SuperPanel implements IView
	{
		public static const TITLE:String = "Linhas";
		
		override public function get title():String{
			return TITLE;
		}
	}
}