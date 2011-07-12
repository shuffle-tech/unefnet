package com.unef.domain.business.payment
{
	import com.unef.domain.base.interfaces.IView;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	public class PaymentTypePanelBase extends SuperPanel implements IView
	{
		public static const TITLE:String = "Formas de Pagamento";
		
		override public function get title():String{
			return TITLE;
		}
	}
}