package com.unef.domain.business.billet
{
	import com.unef.domain.base.controller.BaseController;
	import com.unef.domain.base.event.BaseEvent;
	import com.unef.domain.base.interfaces.IView;
	import com.unef.domain.base.model.IModel;
	import com.unef.domain.business.associated.Associated;
	import com.unef.domain.business.billet.event.BilletEvent;
	import com.unef.domain.business.course.Course;
	import com.unef.domain.business.responsible.Responsible;
	
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import mx.controls.Alert;
	import mx.controls.DateField;
	import mx.events.FlexEvent;
	import mx.utils.ObjectUtil;
	
	public class BilletController extends EventDispatcher
	{
		
		private var model:Billet;
		private var view:BilletUIResource;
		private var service:BilletService;
		
		private var _associated:Associated;
		private var _responsible:Responsible;
		private var _course:Course;
		
		
		
		public function BilletController(view:BilletUIResource)
		{
			super()
			this.view = view;
			this.view.addEventListener(FlexEvent.CREATION_COMPLETE,initializeListeners,false,0,true);
			this.view.addEventListener(FlexEvent.CREATION_COMPLETE,setUpApplication,false,0,true);
		}
		
		public function initializeListeners(event:FlexEvent):void{
			addEventListener(FlexEvent.CREATION_COMPLETE,findAll);
			view.addEventListener(BilletEvent.VISUALIZE_BILLET,visualizeBillet);
			view.addEventListener(BilletEvent.CANCEL_BILLET,cancelBillet);
			view.addEventListener(BilletEvent.TO_WRITE_OFF_BILLET,toWriteOffBillet);
			view.addEventListener(BilletEvent.GENERATE_BILLET,generateSingleBillet);
			view.addEventListener(BilletEvent.GENERATE_BATCH_BILLET,generateBatchBillet);
			view.addEventListener(BilletEvent.START_BILLET_GENERATION,startBilletGeneration);
		}
		
		public function setUpApplication(event:FlexEvent):void{
			service = new BilletService();
			service.addEventListener(BilletEvent.BILLET_GENERATION_COMPLETE,billetGenerationCompleteHandler);
			model = new Billet();
		}
		
		public function findAll(event:FlexEvent):void{
			service.addEventListener(BaseEvent.REGISTERS_LOAD_COMPLETE,findAllResultHandler);
			service.findAllCommand();
		}
		
		protected function findAllResultHandler(event:BaseEvent):void{
			view.grid.dataProvider = event.resultList;
			view.grid.dataProvider.refresh();	
		}
		
		protected function toWriteOffBillet(event:MouseEvent):void{
			// to write off 
		}
		
		protected function generateBatchBillet(event:MouseEvent):void{
			// to write off 
		}
		
		protected function cancelBillet(event:MouseEvent):void{
			// remove 
		}
		
		protected function visualizeBillet(event:BilletEvent):void{
			// TODO criar UIResource.openTab
		}
		
		protected function startBilletGeneration(event:BilletEvent):void{
			model = new Billet();
			model.associated =  associated;
			model.course = course;
			model.expires_on = DateField.stringToDate(view.create.expireDate.text,"DD/MM/YYYY");
			model.value = Number(view.create.billet_value.text);
			model.value_with_discount = Number(view.create.value_with_discount.text);
			service.generateBilletCommand(model);
		}
		
		protected function get course():Course{
			_course = new Course();
			_course.id = view.create.courseSearch.item_id;
			return _course;
		}
		
		protected function get responsible():Responsible{
			_responsible = new Responsible();
			return _responsible;
		}
		
		protected function get associated():Associated{
			_associated = new Associated();
			_associated.id = view.create.associatedSearch.item_id;
			return _associated;
		}
		
		protected function generateSingleBillet(event:BilletEvent):void{
			view.stack.selectedChild = view.addRegister;
		}
		
		protected function billetGenerationCompleteHandler(event:BilletEvent):void{
			dispatchEvent(new BilletEvent(BilletEvent.BILLET_GENERATION_COMPLETE));
		}
		
		
	}
}