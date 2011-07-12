package com.unef.util.forms
{
	import com.unef.events.ResettableFormEvent;
	
	import flash.display.DisplayObject;
	
	import mx.containers.Form;
	import mx.controls.*;
	import mx.controls.sliderClasses.Slider;
	import mx.core.Container;
	import mx.core.UIComponent;
	import mx.formatters.DateFormatter;
	
	public class ResettableForm extends Form
	{
		// When true, focus on the first field in the form
		public var resetFocusFirst:Boolean = false;
		
		// The field that receives focus after a reset event
		public var resetFocusField:DisplayObject;
		
		// Default date format
		public var dateFormat:String = "DD/MM/YYYY";
		
		public function ResettableForm()
		{
			super();
			addEventListener(ResettableFormEvent.RESET_CLICK, reset);
		}
		
		
		private function format(dateString:String, dateFormat:String):String
		{
			var f:DateFormatter = new DateFormatter();
			f.formatString = dateFormat;
			return f.format(dateString);
		}
		
		
		[Bindable(event="resetClick")]
		public function reset():void
		{
			var tmp:DisplayObject;
			var c:Container;
			var ui:DisplayObject;
			var i:int = 0;
			
			for(i = 0; i < getChildren().length; i++)
			{
				tmp = getChildAt(i);
				
				if(tmp is Container)
				{
					c = tmp as Container;
					
					for( var j:int = 0; j < c.getChildren().length; j++)
					{
						resetUIComponent(c.getChildAt(j));
					}
				}
			}
			
			// Optionally set focus 
			if(resetFocusFirst)
			{
				// To the first field
				setFocusToField();         
				
			}
			else if(resetFocusField != null)
			{
				// To the specified field
				setFocusToField(resetFocusField as UIComponent);
			}
		}
		
		private function setFocusToField(fld:UIComponent = null):void
		{
			if(fld != null) 
			{
				if(fld is Container)
				{
					setFocusToField(fld.getChildAt(0) as UIComponent);
				}
				else
				{
					fld.setFocus();                
				}
			}
			else
			{
				for(var i:int = 0; i < getChildren().length; i++)
				{
					if(getChildAt(i) is Container)
					{
						setFocusToField(getChildAt(i) as UIComponent);
					}
					else if(!getChildAt(i) is Label && !getChildAt(i) is Button)
					{
						var focusCtrl:UIComponent = getChildAt(i) as UIComponent;
						focusCtrl.setFocus();
						break;
					}
				}    
			}
		}
		
		public function resetUIComponent(ui:DisplayObject):void
		{
			if(ui is Container)
			{
				var c:Container = ui as Container;
				for(var i:int = 0; i < c.getChildren().length; i++)
				{
					resetUIComponent(c.getChildAt(i));
				}
			}
			else
			{
				if(ui is TextInput)
				{
					var ti:TextInput = ui as TextInput;
					ti.text = "";
				}
				else if(ui is CheckBox)
				{
					var cb:CheckBox = ui as CheckBox;
					cb.selected = false;
				}
				else if(ui is TextArea)
				{
					var ta:TextArea = ui as TextArea;
					ta.text = "";
				}
				else if(ui is ComboBox)
				{
					var combo:ComboBox = ui as ComboBox;
					combo.selectedIndex = 0;
				}
				else if(ui is NumericStepper)
				{
					var ns:NumericStepper = ui as NumericStepper;
					ns.value = 0;
				}
				else if(ui is List)
				{
					var l:List = ui as List;
					l.selectedIndex = -1;
				}
				else if(ui is DateField)
				{
					var d:DateField = ui as DateField;
					if(d.formatString.length > 0)
					{
						dateFormat = d.formatString;
					}
					d.text = format(new Date().toDateString(), dateFormat);
				}
				else if(ui is Slider)
				{
					var s:Slider = ui as Slider;
					s.value = 0;
				}
				else if(ui is RadioButton)
				{
					// TODO: Add optional mechanism for default selection 
					var rb:RadioButton = ui as RadioButton;
					rb.selected = false;
				}
				else
				{
					// No reset action for Button or Label
					if(!ui is Button && !ui is Label)
					{
						// Unchecked element
						trace("Unchecked Element :: " + ui.toString());
					}
				}
			}
		}
	}
}