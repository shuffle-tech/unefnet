package com.unef.domain.business.institutions
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.base.remote.RemoteObjectImpl;
	import com.unef.domain.base.service.BaseService;
	import com.unef.domain.base.service.IService;
	import com.unef.domain.business.institutions.event.InstitutionEvent;
	
	import flash.events.IEventDispatcher;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.utils.ObjectUtil;
	
	public class InstitutionService extends BaseService implements IService
	{
		
		private static const SERVICE_NAME:String = "InstitutionService";
		private var _institution:Institution;
			
		public function InstitutionService(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function get institution():Institution
		{
			return _institution;
		}

		public function set institution(value:Institution):void
		{
			_institution = value;
		}

		override public function deleteCommand(value:IModel):void
		{
			super.deleteCommand(value);
			institution = value as Institution;			
			service.setResultFunction(removeRowResultEvent);
			service.getOperation(REMOVE_OPERATION_NAME).send(institution);			
		}
		
		override public function findAllCommand():void
		{
			super.findAllCommand();
			service.setResultFunction(findAllResultEvent);
			service.getOperation(FIND_ALL_OPERATION_NAME).send();			
		}
		
		override public function findCommand(value:IModel):void
		{
			institution = value as Institution;
		}
		
		override public function saveCommand(value:IModel):void
		{
			super.saveCommand(value);
			institution = value as Institution;  
			service.setResultFunction(resultEvent);
			service.getOperation(SAVE_OPERATION_NAME).send(institution);	
		}
		
		
		override public function updateCommand(value:IModel):void
		{
			super.updateCommand(value);
			institution = value as Institution;
			service.setResultFunction(resultEvent);
			service.getOperation(UPDATE_OPERATION_NAME).send(institution);	
		}
		
		public function resultEvent(event:ResultEvent):void{
			var institutionEvent:InstitutionEvent = new InstitutionEvent(BaseEvent.REGISTER_SAVED);
			dispatchEvent(institutionEvent);
		}
		
		public function removeRowResultEvent(event:ResultEvent):void{
			var institutionEvent:InstitutionEvent = new InstitutionEvent(BaseEvent.REGISTER_DELETED);			
			dispatchEvent(institutionEvent);
		}
		
		public function findAllResultEvent(event:ResultEvent):void{			
			var institutionEvent:InstitutionEvent = new InstitutionEvent(BaseEvent.REGISTERS_LOAD_COMPLETE);
			institutionEvent.resultList = new ArrayCollection(event.result as Array);
			dispatchEvent(institutionEvent);
		}
		
		override public function faultEvent(event:FaultEvent):void{
			Alert.show(event.fault.toString(),"Fault");
		}
		
		override public function get serviceName():String{
			return SERVICE_NAME;
		}
	}
}