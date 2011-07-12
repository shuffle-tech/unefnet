package com.unef.domain.base.ui.workspace
{
	import com.unef.domain.base.environment.GlobalEnvironment;
	import com.unef.domain.base.environment.desktop.IDesktopHolder;
	import com.unef.domain.base.environment.desktop.IWindowHolder;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.loader.DefaultModuleLoader;
	import com.unef.domain.base.ui.resource.UIResource;
	import com.unef.util.Map;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.core.Application;
	import mx.core.UIComponent;
	import mx.managers.PopUpManager;
	import mx.rpc.events.FaultEvent;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	
	public class WorkspaceMediator {
		
		public static const PROGRESS_RETURN_EVENT:String = "progressReturnEvent";
		
		
		private static var _dispatcher:EventDispatcher;
		
		
		public static function get dispatcher():IEventDispatcher {
			if (_dispatcher == null) {
				_dispatcher = new EventDispatcher();
			}
			return _dispatcher;
		}
		
		/**
		 * Open a PopupWindow from an instance
		 */
		private static function openWindow(obj:Object):void {
			try {
				var window:SuperPanel = new SuperPanel();
				window.addElement(obj);
			} catch (e:Error) {
			}
		}
		
		/**
		 * Callback para load de window
		 *
		 * @param memory
		 */
		private static function doneCallBackInWindow(memory:Map):void {
			var obj:Object = memory.getValue("instance");
			openWindow(obj);
		}
		
		/**
		 * Callback para load de view
		 *
		 * @param memory
		 */
		private static function doneCallBackNoWindow(memory:Map):void {
//			var obj:Object = memory.getValue("instance");
//			openTab(obj);
		}
		
		/**
		 * Calback para falha na carga do módulo
		 *
		 * @param memory
		 */
		private static function failCallBack(memory:Map):void {
			
		}
		
		/**
		 * Retorna uma instancia de um objeto
		 */
		public static function getInstance(resource:UIResource, resulHanlder:IResultHandler):void {
//			new DefaultModuleLoader(resource, resulHanlder);
		}
		
		
		public static function closeTab(resource:UIResource = null):void {
			GlobalEnvironment.viewHolder.closeTab(resource);
		}
		
		/**
		 * Retorna a tab aberta atual
		 */
		public static function getCurrentTab():UIResource {
			return GlobalEnvironment.viewHolder.getCurrentTab() as UIResource;
		}
		
		/**
		 * Retorna a view através do UIResource
		 *
		 * @param resource
		 * @return
		 */
		public static function getView(resource:UIResource):IView {
			return GlobalEnvironment.viewHolder.getView(resource) as IView;
		}
		
		/**
		 * Gerencia os evento de fault, exibindo uma mensagem amigaval para o usuário.
		 * @deprecated Favor utilizar o método standardFault
		 *
		 * @param event
		 */
		[Deprecated(replacement="Utilize standardFault ao invés de standartFault", since="2.5.1-SNAPSHOT")]
		public static function standartFault(event:FaultEvent):void {
			standardFault(event);
		}
		
		/**
		 * Define um erro padrao com mensagem
		 */
		public static function standardFault(event:FaultEvent):void {
//			ExceptionUtil.standardFault(event);
		}
		
		/**
		 * Do a proper destination according resource type
		 */
		public static function openResource(resource:UIResource, parameters:Map = null):void {
			switch (resource.type) {
				case UIResource.TYPE_TAB:
					openResourceTab(resource, parameters);
					break;
				case UIResource.TYPE_WINDOW:
					openResourceWindow(resource, parameters);
					break;
				default:
					throw new Error("Unknow resource type: " + resource.type);
			}
		}
		
		[Deprecated(replacement="openResource")]
		private static function openResourceWindow(resource:UIResource, parameters:Map = null):void {
			var vh:IWindowHolder = GlobalEnvironment.windowHolder;
			
			if (vh == null) {
//				dispatcher.dispatchEvent(new DatasulEvent(IndexEvent.SELECT, IndexEvent.SELECT_DESKTOP));
//				dispatcher.addEventListener(IndexEvent.DESKTOP_CREATION_COMPLETED, function(e:Event):void {
//					if (resource != null) {
//						GlobalEnvironment.windowHolder.openWindow(resource, parameters);
//						resource = null;
//					}
//				});
			} else {
				vh.openWindow(resource, parameters);
			}
		}           
		
		[Deprecated(replacement="openResource")]
		private static function openResourceTab(resource:UIResource, parameters:Map = null):void {
			var vh:IDesktopHolder = GlobalEnvironment.viewHolder;
			
			if (vh == null) {
//				dispatcher.addEventListener(IndexEvent.DESKTOP_CREATION_COMPLETED, function(e:Event):void {
//					if (resource != null) {
//						GlobalEnvironment.viewHolder.openTab(resource, parameters);
//						resource = null;
//					}
//				});
			} else {
				vh.openTab(resource, parameters);
			}
		}        
		
		/**
		 * Altera o tamanho de um portlet
		 */
		public static function changeSizeCompactPortlet(position:int = -1, size:int = 0):void {
			if (position > -1) {
				//GlobalEnvironment.viewHolder.changeSizeCompactPortlet(position, size);
			}
		}
		
		/**
		 * Executa um programa Progress
		 */
		public static function runProgress(program:String, ... params):void {
			Application.application.runProgress(program, params);
		}
		
		/**
		 * Executa um programa Progress (via Metadados)
		 */
		public static function runProgressMD(program:String, params:Array):void {
			Application.application.runProgressMD(program, params);
		}
	}
}
