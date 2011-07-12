package com.unef.domain.base.environment.desktop {
	import com.unef.domain.base.environment.workspace.IModuleLoader;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.ui.resource.UIResource;
	import com.unef.util.Map;
	
	
	
	public interface IViewHolder {
		

		function openTab(resource:UIResource, parameters:Map = null):IModuleLoader;
		
		function closeTab(resource:UIResource = null):void;
		
		function getCurrentTab():UIResource;
		
		function getView(resource:UIResource):IView;
		
		function openView(view:IView, focus:Boolean = true):void;
		
		function changeSizeCompactPortlet(position:int = -1, size:int = 0):void;
	}
}
