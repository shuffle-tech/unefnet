package com.unef.domain.base.environment.desktop {
	import com.unef.domain.base.ui.resource.UIResource;
	
	
	public interface IDesktopHolder extends IViewHolder {
		
		/**
		 * Abre a view correspondente à posição informada.
		 */
		function selectByPosition(position:int):void;
		
		/**
		 * Joga o focus em determinado recurso
		 */
		function resourceFocusIn(resource:UIResource):void;
	}
}
