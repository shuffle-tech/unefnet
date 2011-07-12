package com.unef.domain.base.interfaces
{
	/**
	 * 
	 */ 
	
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.service.BaseService;
	
	import mx.events.FlexEvent;

	public interface IController extends IBaseMethods
	{
		function setUpApplication(event:FlexEvent):void;
		function get model():IModel;
		function set model(model:IModel):void;
		function get service():BaseService;
		function set service(service:BaseService):void;		
	}
}