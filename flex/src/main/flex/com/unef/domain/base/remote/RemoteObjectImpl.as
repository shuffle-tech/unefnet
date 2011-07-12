package com.unef.domain.base.remote
{
	import mx.controls.Alert;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
//	import mx.rpc.remoting.mxml.RemoteObject;
	import mx.rpc.remoting.RemoteObject;
	
	public class RemoteObjectImpl extends RemoteObject
	{
		public static const AMF_CHANNEL:String = "my-amf";
		
		public function RemoteObjectImpl(destination:String=null)
		{
			super();
			super.showBusyCursor = true;
			super.addEventListener(FaultEvent.FAULT, onFault);
			if(destination is String){
				super.source = destination;
			}
		}
		
		public function setResultFunction(resultFunction:Function=null):void {
			if(resultFunction is Function){
				super.addEventListener(ResultEvent.RESULT, resultFunction);
			}
		}
		
		public function onFault(e:FaultEvent):void{
			Alert.show(e.fault.faultString+"\n"+e.fault.faultDetail, "ERROR " + e.fault.faultCode.toString());
		}
		
		
	}
}