package com.datasul.framework.ui.workspace {
	
	import com.unef.domain.base.environment.workspace.IModuleLoader;
	import com.unef.domain.base.ui.workspace.IResultHandler;
	
	import flash.events.EventDispatcher;
	
	[Event(name="result", type="com.datasul.framework.ui.workspace.ModuleLoaderEvent")]
	
	[Event(name="fault", type="com.datasul.framework.ui.workspace.ModuleLoaderEvent")]
	
	public class ModuleLoader extends EventDispatcher implements IResultHandler, IModuleLoader {
		
		/**
		 * @private
		 */
		private var resultHandler:IResultHandler;
		
		/**
		 * @private
		 */
		private var lmc:LoadModuleController;
		
		/**
		 * Construtor padrão da classe.
		 *
		 * @param resource
		 *        Informações sobre a funcionalidade a ser aberta.
		 * @param resultHandler
		 *        Para onde deve ser enviada as informações ao final da carga do módulo.
		 */
		public function ModuleLoader(resource:UIResource, resultHandler:IResultHandler) {
			this.resultHandler = resultHandler;
			lmc =
					new LoadModuleController(resource.resourceName, resource.moduleName, this.onResult, this.onFault,
					"", "", resource.padrao, resource);
		}
		
		/**
		 * Efetua a chamada ao handler responsável por gerenciar o final da carga do módulo.
		 *
		 * @param memory
		 *        Resultado da carga do módulo.
		 */
		public function onResult(memory:Map):void {
			this.resultHandler.onResult(memory);
			this.dispatchEvent(new ModuleLoaderEvent(ModuleLoaderEvent.RESULT, memory));
		}
		
		/**
		 * Efetua a chamada ao handler responsável por gerenciar o final da carga do módulo, repassando o erro
		 * ocorrido.
		 *
		 * @param memory
		 *        Resultado da carga do módulo.
		 */
		public function onFault(memory:Map):void {
			this.resultHandler.onFault(memory);
			this.dispatchEvent(new ModuleLoaderEvent(ModuleLoaderEvent.FAULT, memory));
		}
	
	}

}
