package com.unef.domain.business.associated.type
{
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.contracts.Contract;
	
	[Bindable]
	[RemoteClass(alias="AssociatedType")]
	public class AssociatedType extends BaseModel
	{
		private var _modality:String;
		private var _value:Number;
		private var _discount_value:Number;
		private var _contract:Contract;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;

		
		public function get contract_description():String{
			return contract.description;
		}
		
		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			_value = value;
		}

		public function get discount_value():Number
		{
			return _discount_value;
		}

		public function set discount_value(value:Number):void
		{
			_discount_value = value;
		}

		public function get contract():Contract
		{
			return _contract;
		}

		public function set contract(value:Contract):void
		{
			_contract = value;
		}

		public function get created_at():Date
		{
			return _created_at;
		}

		public function set created_at(value:Date):void
		{
			_created_at = value;
		}

		public function get updated_at():Date
		{
			return _updated_at;
		}

		public function set updated_at(value:Date):void
		{
			_updated_at = value;
		}

		public function get created_by():String
		{
			return _created_by;
		}

		public function set created_by(value:String):void
		{
			_created_by = value;
		}

		public function get modality():String
		{
			return _modality;
		}

		public function set modality(value:String):void
		{
			_modality = value;
		}

	}
}