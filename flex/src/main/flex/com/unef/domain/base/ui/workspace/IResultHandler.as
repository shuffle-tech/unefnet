package com.unef.domain.base.ui.workspace {
	import com.unef.util.Map;
	
	
	
	public interface IResultHandler {
		/**
		 * Adiciona um compact portlet.
		 */
		function onResult(memory:Map):void;
		
		/**
		 * Se ocorrer algum erro para carregar um compact portlet
		 */
		function onFault(memory:Map):void;
	
	}
}
