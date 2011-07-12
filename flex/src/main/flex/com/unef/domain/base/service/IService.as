package com.unef.domain.base.service
{
	import com.unef.domain.base.model.IModel;
	
	import mx.rpc.events.FaultEvent;

	public interface IService
	{
		function faultEvent(event:FaultEvent):void;
		function saveCommand(value:IModel):void;
		function findCommand(value:IModel):void;
		function findAllCommand():void;
		function deleteCommand(value:IModel):void;
		function updateCommand(value:IModel):void;
		function get serviceName():String;
	}
}