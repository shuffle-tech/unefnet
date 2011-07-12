package com.unef.domain.base.ui.resource
{
	import mx.collections.ArrayCollection;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;

	public class UIResource
	{
		private static var MODULES_DIR:String = "com/unef/domain/modules";
		
		public static var TYPE_TAB:String = "tab";
		public static var TYPE_WINDOW:String = "window";
		
		public static var instances:ArrayCollection = new ArrayCollection();
		
		private var _moduleName:String;
		private var _description:String;
		private var _type:String;
		
		public function get moduleName():String
		{
			return _moduleName;
		}

		public function set moduleName(value:String):void
		{
			_moduleName = value;
		}

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function set type(value:String):void
		{
			_type = value;
		}
		
		public static function getInstance(moduleName:String,description:String):UIResource{
			var module:String = StringUtil.substitute("{0}/{1}",MODULES_DIR,moduleName);
			var newInstance:UIResource = new UIResource(module,description);
			
			for each (var instance:UIResource in instances) {
				if (ObjectUtil.compare(newInstance, instance) == 0) {
					return instance;
				}
			}
			instances.addItem(newInstance);
			return newInstance;        
		}
		
		public function UIResource(moduleName:String,description:String):void{
			_moduleName = moduleName;
			_description = description;
		}


	}
}