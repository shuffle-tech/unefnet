package com.unef.ui.components.desktop
{
	import com.datasul.framework.ui.progressmonitor.SimpleProgressMonitor;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.business.associated.AssociatedPanel;
	import com.unef.domain.business.billet.BilletUIResource;
	import com.unef.domain.business.course.CoursePanel;
	import com.unef.domain.business.institutions.InstitutionPanel;
	import com.unef.domain.business.route.RoutePanel;
	import com.unef.domain.business.shifts.ShiftPanel;
	
	import flash.events.MouseEvent;
	
	import flexlib.controls.tabBarClasses.SuperTab;
	
	import mx.collections.ArrayCollection;
	import mx.containers.VBox;
	import mx.controls.Alert;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.events.ModuleEvent;
	import mx.utils.StringUtil;
	
	import nl.wv.extenders.panel.SuperPanel;
	
	import spark.components.Application;
	import spark.modules.ModuleLoader;

	public class Desktop extends DesktopTemplate implements IView
	{
		private static var instances:ArrayCollection = new ArrayCollection();
		public static const MODULES_DIR:String = "com/unef/domain/modules";
		
		public var _progressMonitor:SimpleProgressMonitor;
		public var current:UIComponent;
		
		public function Desktop()
		{
			super();
			addEventListener(FlexEvent.CREATION_COMPLETE,initNonClosableTab,false,0,true);
		}
		
		
		override protected function initializationComplete():void{
			addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners);
		}
		
		protected function initializeListeners(event:FlexEvent):void{
			menulist.associated.addEventListener(MouseEvent.CLICK,addAssociated);
			menulist.billet.addEventListener(MouseEvent.CLICK,addBillet);
			menulist.courses.addEventListener(MouseEvent.CLICK,addCourses);
			menulist.routes.addEventListener(MouseEvent.CLICK,addRoute);
			menulist.institutions.addEventListener(MouseEvent.CLICK,addInstitution);
			menulist.shifts.addEventListener(MouseEvent.CLICK,addShift);
		}
		
		protected function getContainer(title:String):VBox{
			var tab:VBox = new VBox();
			tab.percentHeight = 100;
			tab.percentWidth = 100;
			tab.label = title;
			return tab;
		}
		
		protected function getModule(uri:String):ModuleLoader{
			var module:ModuleLoader = new ModuleLoader();
			module.addEventListener(ModuleEvent.SETUP,loadStarted);
			module.addEventListener(ModuleEvent.READY,showModule);
			module.url = StringUtil.substitute("{0}/{1}.swf",MODULES_DIR,uri);
			module.loadModule();
			module.percentHeight = 100;
			module.percentWidth = 100;
			return module;
		}
		
		protected function addAssociated(event:MouseEvent):void{
			var container:VBox = getContainer("Associados");
			container.addElement(getModule("AssociatedModule"));
			addElement(container);
			selectedChild = container;
			//instances.addItem({"associated":container});
		}
		protected function addBillet(event:MouseEvent):void{
			var container:VBox = getContainer("Boletos");
			container.addElement(getModule("BilletModule"));
			addElement(container);
			selectedChild = container;
			//instances.addItem({"billet":container});
		}
		
		
		protected function loadStarted(event:ModuleEvent):void{
		 	if (null == current){
				current = this.owner as UIComponent;
			}
			showProgressMonitor(current);
		}
		
		protected function errorOnLoadModule(event:ModuleEvent):void{
		 	//Alert.show("erro " + event.errorText);
		}
		
		protected function showModule(event:ModuleEvent):void{
		 	hideProgressMonitor();
		}
		
		
		protected function addCourses(event:MouseEvent):void{
			var window:CoursePanel = new CoursePanel();
			dashboard.container.addElement(window);
			dashboard.container.organize();
		}
		protected function addRoute(event:MouseEvent):void{
			var window:RoutePanel = new RoutePanel();
			dashboard.container.addElement(window);
			dashboard.container.organize();
		}
		protected function addInstitution(event:MouseEvent):void{
			var window:InstitutionPanel = new InstitutionPanel();
			dashboard.container.addElement(window);
			dashboard.container.organize();
		}
		protected function addShift(event:MouseEvent):void{
			var window:ShiftPanel = new ShiftPanel();
			dashboard.container.addElement(window);
			dashboard.container.organize();
		}
		
		private function initNonClosableTab(event:FlexEvent):void {
			setClosePolicyForTab(0,SuperTab.CLOSE_NEVER);			
		}
		
		protected function showProgressMonitor(target:UIComponent):void{
			if(null == _progressMonitor){
				_progressMonitor = new SimpleProgressMonitor();
				//_progressMonitor.animationMessage = "Carrgando módulo";
				_progressMonitor.lockParentOnly = true;
				_progressMonitor.modal = true;
				//_progressMonitor.removeLoaderBorderAndBackground = true;
				_progressMonitor.loaderAnimationColor = 0xFFFFFF;
				_progressMonitor.modalBackgroundColor = 0x000000;
			}
			_progressMonitor.parent = this.owner as UIComponent;
			_progressMonitor.show()
		}
		
		protected function hideProgressMonitor():void{
			if(_progressMonitor){
				_progressMonitor.hide();
			}
		}
		
	}
}