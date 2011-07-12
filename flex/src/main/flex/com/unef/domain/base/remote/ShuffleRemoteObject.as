package com.unef.domain.base.remote {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	use namespace flash_proxy;
	

	public dynamic class ShuffleRemoteObject extends Proxy implements IEventDispatcher {
		
		public static const SESSION:String = "session";
		
		public static const REQUEST:String = "request";
		
		public static const APPLICATION:String = "application";
		
		private var dispatcher:EventDispatcher;
		
		/**
		 * Destino java a ser executado
		 */
		public var destination:String;
		
		/**
		 * Escopo do objeto do lado java.  Valores validos: application, session e request
		 */
		public var scope:String;
		
		/**
		 * Mantem uma copia com as configuracoes dos metodos que podem vir a ser invocados.
		 */
		private var methods:Object = new Object();
		
		/**
		 * Construtor default. Aceita um destino como parametro.  Dispensando codificacao futura.
		 */
		public function ShuffleRemoteObject(destination:String = null):void {
			this.dispatcher = new EventDispatcher(this);
			this.destination = destination;
		}
		
		/**
		 * Proxy flex que retorna uma instancia de RemoteCall para qualquer atributo nao
		 * declarado que venha a ser invocado apenas get, set nao implementado.  Comportamento
		 * similar a classe mx.rpc.remoting.RemoteObject.
		 */
		override flash_proxy function getProperty(name:*):* {
			return getRemoteCall(name.toString());
		}
		
		/**
		 * Lazy load e cache dos remoteCall.  Cria na primeira invocacao e reusa nas chamadas
		 * subsequentes.
		 */
		private function getRemoteCall(name:String):RemoteCall {
			if (methods[name] == null) {
				var rc:RemoteCall = new RemoteCall(destination);
				rc.name = name;
				rc.scope = scope;
				rc.defineListeners(dispatchEvent, dispatchEvent, dispatchEvent);
				methods[name] = rc;
			}
			return methods[name];
		}
		
		/**
		 * Absorve a execucao de um metodo passando para o RemoteCall.
		 */
		override flash_proxy function callProperty(name:*, ... param):* {
			var rc:RemoteCall = getRemoteCall(name.toString());
			rc.execute(param);
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0,
				useWeakReference:Boolean = false):void {
			this.dispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			this.dispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean {
			return dispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean {
			return dispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean {
			return dispatcher.willTrigger(type);
		}
	
	}
}
