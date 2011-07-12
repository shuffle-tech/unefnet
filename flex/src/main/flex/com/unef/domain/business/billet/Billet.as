package com.unef.domain.business.billet
{
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.associated.Associated;
	import com.unef.domain.business.course.Course;
	import com.unef.domain.business.responsible.Responsible;
	
	import mx.controls.Alert;
	[Bindable]
	[RemoteClass(alias="Billet")]
	public class Billet extends BaseModel
	{
	
		private var _number:String;
		private var _manual_input_line:String;
		private var _course:Course;
		private var _associated:Associated;
		private var _responsible:Responsible;
		private var _value:Number;
		private var _amount_paid:Number;
		private var _value_with_discount:Number;
		private var _generated_at:Date;
		private var _expires_on:Date;
		private var _stats:String;
		private var _checked_at:Date;
		private var _payment_location:String;
		private var _created_by:String;
		private var _checked_by:String;
		
		public function get associated_name():String{
			return associated.full_name;
		}
		
		public function get responsible_name():String{
			return responsible.full_name;
		}

		public function get manual_input_line():String
		{
			return _manual_input_line;
		}

		public function set manual_input_line(value:String):void
		{
			_manual_input_line = value;
		}
		
		public function get course():Course
		{
			return _course;
		}

		public function set course(value:Course):void
		{
			_course = value;
		}
		
		public function get number():String
		{
			return _number;
		}

		public function set number(value:String):void
		{
			_number = value;
		}

		public function get associated():Associated
		{
			return _associated;
		}

		public function set associated(value:Associated):void
		{
			_associated = value;
		}

		public function get responsible():Responsible
		{
			return _responsible;
		}

		public function set responsible(value:Responsible):void
		{
			_responsible = value;
		}

		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			_value = value;
		}

		public function get amount_paid():Number
		{
			return _amount_paid;
		}

		public function set amount_paid(value:Number):void
		{
			_amount_paid = value;
		}

		public function get value_with_discount():Number
		{
			return _value_with_discount;
		}

		public function set value_with_discount(value:Number):void
		{
			_value_with_discount = value;
		}

		public function get generated_at():Date
		{
			return _generated_at;
		}

		public function set generated_at(value:Date):void
		{
			_generated_at = value;
		}

		public function get expires_on():Date
		{
			return _expires_on;
		}

		public function set expires_on(value:Date):void
		{
			_expires_on = value;
		}

		public function get stats():String
		{
			return _stats;
		}

		public function set stats(value:String):void
		{
			_stats = value;
		}

		public function get checked_at():Date
		{
			return _checked_at;
		}

		public function set checked_at(value:Date):void
		{
			_checked_at = value;
		}

		public function get payment_location():String
		{
			return _payment_location;
		}

		public function set payment_location(value:String):void
		{
			_payment_location = value;
		}

		public function get created_by():String
		{
			return _created_by;
		}

		public function set created_by(value:String):void
		{
			_created_by = value;
		}

		public function get checked_by():String
		{
			return _checked_by;
		}

		public function set checked_by(value:String):void
		{
			_checked_by = value;
		}


	}
}