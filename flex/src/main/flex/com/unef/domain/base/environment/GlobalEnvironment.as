package com.unef.domain.base.environment {
	import com.unef.domain.base.environment.desktop.IViewHolder;
	import com.unef.domain.base.environment.desktop.IWindowHolder;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.util.Map;
	

	public class GlobalEnvironment {
		
		public static var viewHolder:IViewHolder;
	
		public static var windowHolder:IWindowHolder;
		
		public static var loadedDesktopContent:Map = new Map();
	
	}
}
