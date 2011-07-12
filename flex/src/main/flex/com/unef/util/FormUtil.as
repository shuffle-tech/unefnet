package com.unef.util
{
	import com.unef.domain.base.model.BaseModel;
	
	import flash.utils.describeType;
	
	import mx.controls.AdvancedDataGrid;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.utils.ObjectUtil;
	
	import spark.components.Label;
	import spark.components.SkinnableContainer;
	import spark.components.TextArea;
	import spark.components.TextInput;
	import spark.components.supportClasses.SkinnableTextBase;
	
	public class FormUtil
	{
		public function FormUtil()
		{
			super();
		}
		
		/**
		 * 
		 * @param component
		 * 
		 */
		public static function clearFields(component:UIComponent):void{
			var classInfo:XML = describeType(component);
			for each(var node:XML in classInfo..accessor){
				try
				{
					var item:Object = component[node.@name];
					if (item.hasOwnProperty("text")){
						item.text = "";
					}else if (item.hasOwnProperty("selectedValue")){
						item.selectedIndex = 0;
					}else if (item.hasOwnProperty("selected")){
						item.selected = false;
					}else if (item is AdvancedDataGrid){
						item.dataProvider = null;
					}
				} 
				catch(error:Error) 
				{
					continue;
				}
			}
		}
		
		/**
		 * 
		 * @param source
		 * @param target
		 * 
		 */
		public static function populate(source:BaseModel, target:UIComponent):void{
			var classInfo:XML = describeType(source);
			for each(var node:XML in classInfo..accessor){
				try
				{
					var item:Object = target[node.@name];
					var sourceItem:Object = source[node.@name];
					if (item.hasOwnProperty("text")){
						item.text = sourceItem;
					}else if (item.hasOwnProperty("selectedValue")){
						item.selectedValue = sourceItem;
					}else if (item.hasOwnProperty("selected")){
						item.selected = sourceItem;
					}
				} 
				catch(error:Error) 
				{
					continue;
				}
			}
		}
		
		public static function populateModel(source:UIComponent,target:BaseModel):BaseModel{
			var classInfo:XML = describeType(source);
			for each(var node:XML in classInfo..accessor){
				try
				{
					var item:Object = source[node.@name];
					var targetItem:Object = target[node.@name];
					if (item.hasOwnProperty("text")){
						target[node.@name] = item.text;
					}else if (item.hasOwnProperty("selectedValue")){
						target[node.@name] = item.selectedValue;
					}else if (item.hasOwnProperty("selected")){
						target[node.@name] = item.selected;
					}
				} 
				catch(error:Error) 
				{
					continue;
				}
			}
			return target;
		}
	}
}