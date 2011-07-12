package com.unef.domain.business.billet
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.remote.RemoteObjectImpl;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.business.billet.event.BilletEvent;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	[Event(name="billetGenerationComplete", type="com.unef.domain.business.billet.event.BilletEvent")]
	[Event(name="billetBatchGenerationComplete", type="com.unef.domain.business.billet.event.BilletEvent")]
	[Event(name="billetCancellationComplete", type="com.unef.domain.business.billet.event.BilletEvent")]
	
	public class BilletService extends EventDispatcher
	{
		public static const GENERATE_BILLET_OPERATION_NAME:String = "generateBillet";		
		public static const GENERATE_BATCH_BILLET_OPERATION_NAME:String = "batchBilletGeneration";		
		public static const TO_WRITE_OFF_OPERATION_NAME:String = "update";		
		public static const CANCEL_OPERATION_NAME:String = "cancel";		
		public static const FIND_ALL_OPERATION_NAME:String = "findAll";
		
		private var _service:RemoteObjectImpl;
		private var _model:BaseModel;
		
		public function BilletService(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function get model():BaseModel
		{
			return _model;
		}
		
		public function set model(value:BaseModel):void
		{
			_model = value;
		}
		
		public function faultEvent(event:FaultEvent):void
		{
			_service = new RemoteObjectImpl(serviceName);	
		}
		
		public function batchGenerateCommand(value:ArrayCollection):void
		{
			_service = new RemoteObjectImpl(serviceName);
			service.setResultFunction(resultEvent);
			service.getOperation(GENERATE_BATCH_BILLET_OPERATION_NAME).send(model);
		}
		
		public function generateBilletCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
			service.setResultFunction(resultEvent);
			service.getOperation(GENERATE_BILLET_OPERATION_NAME).send(value);
		}
		
		public function findCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function findAllCommand():void
		{
			_service = new RemoteObjectImpl(serviceName);
			service.setResultFunction(findAllResultEvent);
			service.getOperation(FIND_ALL_OPERATION_NAME).send();			
		}
		
		public function findAllResultEvent(event:ResultEvent):void{			
			var result:BaseEvent = new BaseEvent(BaseEvent.REGISTERS_LOAD_COMPLETE);
			result.resultList = new ArrayCollection(event.result as Array);
			dispatchEvent(result);
		}
		
		public function cancelCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function updateCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function resultEvent(event:ResultEvent):void{
			var result:BilletEvent = new BilletEvent(BilletEvent.BILLET_GENERATION_COMPLETE);
			dispatchEvent(result);
		}
		
		public function get serviceName():String{
			return  "BilletService"; 	
		}
		
		protected function get service():RemoteObjectImpl{
			if (null == _service){
				_service =new RemoteObjectImpl(serviceName);	
			} 
			return _service;
		}
	}
}