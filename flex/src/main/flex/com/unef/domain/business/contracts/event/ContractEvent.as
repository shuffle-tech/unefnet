package com.unef.domain.business.contracts.event
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	
	import mx.collections.ArrayCollection;
	
	public class ContractEvent extends BaseEvent
	{
		public function ContractEvent(type:String)
		{
			super(type);
		}
	}
}