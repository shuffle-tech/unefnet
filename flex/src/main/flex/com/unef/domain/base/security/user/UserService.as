package com.unef.domain.base.security.user
{
	import com.unef.domain.service.BaseService;
	
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	
	public class UserService extends BaseService
	{
		
		public static const SERVICE_NAME:String="UserService";
		
		public function UserService(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		override public function deleteCommand(value:IModel):void
		{
			
		}
		
		override public function faultEvent(event:FaultEvent):void
		{
			
		}
		
		override public function findAllCommand(value:IModel):void
		{
			
		}
		
		override public function findCommand(value:IModel):void
		{
			
		}
		
		override public function saveCommand(value:IModel):void
		{
			
		}
		
		override public function updateCommand(value:IModel):void
		{
			
		}
		
		
	}
}