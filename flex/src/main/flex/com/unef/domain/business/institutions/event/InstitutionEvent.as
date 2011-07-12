package com.unef.domain.business.institutions.event
{
	import com.unef.domain.base.event.BaseEvent;
	

	public class InstitutionEvent extends BaseEvent
	{
		
		public function InstitutionEvent(type:String)
		{
			super(type);
		}
	}
}