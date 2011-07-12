package com.unef.domain.base.environment.desktop {
	import com.unef.domain.base.environment.workspace.IModuleLoader;
	import com.unef.domain.base.ui.resource.UIResource;
	import com.unef.util.Map;
	
	public interface IWindowHolder {
		
		function openWindow(resource:UIResource, parameters:Map = null):IModuleLoader;
	
	}
}
