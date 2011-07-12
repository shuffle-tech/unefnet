package com.unef.domain.business.contracts
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.service.BaseService;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	
	public class ContractService extends BaseService
	{
		
		private static const SERVICE_NAME:String = "ContractService";
		
		public function ContractService(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		override public function deleteCommand(value:IModel):void
		{
			super.deleteCommand(value);
			model = value as BaseModel;			
			service.setResultFunction(removeRowResultEvent);
			service.getOperation(REMOVE_OPERATION_NAME).send(model);			
		}
		
		override public function findAllCommand():void
		{
			super.findAllCommand();
			service.setResultFunction(findAllResultEvent);
			service.getOperation(FIND_ALL_OPERATION_NAME).send();			
		}
		
		override public function findCommand(value:IModel):void
		{
			model = value as BaseModel;
		}
		
		override public function saveCommand(value:IModel):void
		{
			super.saveCommand(value);
			model = value as BaseModel;
			service.setResultFunction(resultEvent);
			service.getOperation(SAVE_OPERATION_NAME).send(model);	
		}
		
		
		override public function updateCommand(value:IModel):void
		{
			super.updateCommand(value);
			model = value as BaseModel;
			service.setResultFunction(resultEvent);
			service.getOperation(UPDATE_OPERATION_NAME).send(model);	
		}
		
		public function resultEvent(event:ResultEvent):void{
			var result:BaseEvent = new BaseEvent(BaseEvent.REGISTER_SAVED);
			dispatchEvent(result);
		}
		
		public function removeRowResultEvent(event:ResultEvent):void{
			var result:BaseEvent = new BaseEvent(BaseEvent.REGISTER_DELETED);			
			dispatchEvent(result);
		}
		
		public function findAllResultEvent(event:ResultEvent):void{			
			var result:BaseEvent = new BaseEvent(BaseEvent.REGISTERS_LOAD_COMPLETE);
			result.resultList = new ArrayCollection(event.result as Array);
			dispatchEvent(result);
		}
		
		override public function faultEvent(event:FaultEvent):void{
			Alert.show(event.fault.toString(),"Fault");
		}
		
		override public function get serviceName():String{
			return SERVICE_NAME;
		}
		
		
	}
}