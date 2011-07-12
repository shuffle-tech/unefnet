package com.unef.domain.business.institutions.search
{
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.business.institutions.Institution;
	import com.unef.domain.business.route.crud.RouteCreateEditTemplate;
	import com.unef.util.search.SearchContent;
	import com.unef.util.search.component.SearchButtonComponent;
	import com.unef.util.search.component.SearchInputComponent;
	
	import flash.display.DisplayObject;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.core.Application;
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	import mx.states.OverrideBase;
	
				 
	public class InstitutionsSearchButtonComponent extends SearchButtonComponent
	{
		
		private var _institutionWindow:InstitutionsSearchMultipleContent;
		private static const GRID_NAME:String = "grid";
		
		override public function setUpApplication(event:FlexEvent):void{	
			super.setUpApplication(event);
		}
		
		override public function get window():IFlexDisplayObject{
			if (null == _institutionWindow){
				_institutionWindow = new InstitutionsSearchMultipleContent();
				_institutionWindow.title = "Instituições";
				_institutionWindow.addEventListener(BaseEvent.SELECTED_REGISTER,updateInputField,false,0,true);
			}
			return _institutionWindow; 
		}
		
		protected function updateInputField(event:BaseEvent):void{
			if (null == caller[GRID_NAME].dataProvider){
				caller[GRID_NAME].dataProvider = new ArrayCollection();
			}
			caller[GRID_NAME].dataProvider.addAll(event.resultList);
		}
		
		
	}
}