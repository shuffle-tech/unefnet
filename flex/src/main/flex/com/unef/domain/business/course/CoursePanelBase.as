package com.unef.domain.business.course
{
	import com.unef.domain.base.interfaces.IView;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	public class CoursePanelBase extends SuperPanel implements IView
	{
		public static const TITLE:String = "Cursos";
		
		override public function get title():String{
			return TITLE;
		}
	}
}