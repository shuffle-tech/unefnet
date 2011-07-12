package com.unef.util.validator
{
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import mx.controls.Alert;
	import mx.events.ValidationResultEvent;
	import mx.validators.Validator;
	
	[Bindable]
	public class FormValidator extends EventDispatcher
	{
		private var _formIsValid:Boolean = false;
		private var _validators:Array;
		
		private var focusedFormControl:DisplayObject;
		
		public function FormValidator(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public function validateForm(event:Event):void
		{
			focusedFormControl = event.target as DisplayObject;
			formIsValid = true;
			for each( var validator:Validator in validators ){
				validate(validator);
			}
		}
		
		
		private function validate(validator:Validator):Boolean
		{
			var validatorSource:DisplayObject = validator.source as DisplayObject;
			var supressEvents:Boolean = validatorSource != focusedFormControl;
			var event:ValidationResultEvent = validator.validate(null, supressEvents)
			var currentControlIsValid:Boolean = event.type == ValidationResultEvent.VALID;
			
			formIsValid = formIsValid && currentControlIsValid;
			return currentControlIsValid;
		}
		
		public function get formIsValid():Boolean{		
			return _formIsValid;
		}
		
		public function set formIsValid(isValid:Boolean):void{		
			_formIsValid = isValid;
		}
		
		public function get validators():Array{
			return _validators;
		}
		
		public function set validators(list:Array):void{
			_validators = list;
		}
	}
}