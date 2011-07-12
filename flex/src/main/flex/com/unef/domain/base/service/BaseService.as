package com.unef.domain.base.service
{
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.remote.RemoteObjectImpl;
	
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.rpc.events.FaultEvent;
	
	public class BaseService extends EventDispatcher implements IService
	{
		public static const SAVE_OPERATION_NAME:String = "save";		
		public static const UPDATE_OPERATION_NAME:String = "update";		
		public static const REMOVE_OPERATION_NAME:String = "remove";		
		public static const FIND_ALL_OPERATION_NAME:String = "findAll";
		public static const FIND_OPERATION_NAME:String = "find";
		
		private var _service:RemoteObjectImpl;
		private var _model:BaseModel;
		
		public function BaseService(target:IEventDispatcher=null)
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
		
		public function saveCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function findCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function findAllCommand():void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function deleteCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function updateCommand(value:IModel):void
		{
			_service = new RemoteObjectImpl(serviceName);
		}
		
		public function get serviceName():String{
			return  null; 	
		}
		
		protected function get service():RemoteObjectImpl{
			if (null == _service){
				_service =new RemoteObjectImpl(serviceName);	
			} 
			return _service;
		}
		
	}
}