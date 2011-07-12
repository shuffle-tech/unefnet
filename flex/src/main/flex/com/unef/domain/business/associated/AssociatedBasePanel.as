package com.unef.domain.business.associated
{
	import nl.wv.extenders.panel.SuperPanel;
	
	public class AssociatedBasePanel extends SuperPanel
	{
		public static const TITLE:String = "Associados";
		
		override public function get title():String{
			return TITLE;
		}
	}
}