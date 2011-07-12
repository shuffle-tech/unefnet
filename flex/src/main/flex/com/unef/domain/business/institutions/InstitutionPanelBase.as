package com.unef.domain.business.institutions
{
	import com.unef.domain.base.interfaces.IView;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	public class InstitutionPanelBase extends SuperPanel implements IView
	{
		public static const TITLE:String = "Instituições";
		
		override public function get title():String{
			return TITLE;
		}
	}
}