package com.unef.domain.business.shifts
{
	import com.unef.domain.base.interfaces.IView;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	public class ShiftPanelBase extends SuperPanel implements IView
	{
		public static const TITLE:String = "Turnos";
		
		override public function get title():String{
			return TITLE;
		}
	}
}