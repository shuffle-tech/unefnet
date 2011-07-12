package com.unef.domain.base.environment.workspace {
	
	import flash.events.IEventDispatcher;
	
	/**
	 *  @eventType com.datasul.framework.ui.workspace.ModuleLoaderEvent.RESULT
	 */
	[Event(name="result", type="com.unef.domain.base.environment.workspace.ModuleLoaderEvent")]
	
	/**
	 *  @eventType com.datasul.framework.ui.workspace.ModuleLoaderEvent.FAULT
	 */
	[Event(name="fault", type="com.unef.domain.base.environment.workspace.ModuleLoaderEvent")]
	public interface IModuleLoader extends IEventDispatcher {
	
	}
}
