package com.unef.domain.business.associated
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.base.service.IService;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class AssociatedService extends BaseService implements IService
	{
		
		private static const SERVICE_NAME:String = "AssociatedService";
		
		public function AssociatedService(target:IEventDispatcher=null)
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
			var resultEvent:BaseEvent = new BaseEvent(BaseEvent.REGISTER_SAVED);
			dispatchEvent(resultEvent);
		}
		
		public function removeRowResultEvent(event:ResultEvent):void{
			var resultEvent:BaseEvent = new BaseEvent(BaseEvent.REGISTER_DELETED);			
			dispatchEvent(resultEvent);
		}
		
		public function findAllResultEvent(event:ResultEvent):void{
			var resultEvent:BaseEvent = new BaseEvent(BaseEvent.REGISTERS_LOAD_COMPLETE);
			resultEvent.resultList = new ArrayCollection(event.result as Array);
			dispatchEvent(resultEvent);
		}
		
		override public function faultEvent(event:FaultEvent):void{
			Alert.show(event.fault.toString(),"Fault");
		}
		
		override public function get serviceName():String{
			return SERVICE_NAME;
		}
	}
}