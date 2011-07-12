package com.unef.domain.business.course
{
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.institutions.Institution;
	
	[Bindable]
	[RemoteClass(alias="Course")]
	public class Course extends BaseModel
	{
		private var _title:String;
		private var _description:String;
		private var _institution:Institution;
		private var _created_at:Date;
		private var _updated_at:Date;
		private var _created_by:String;

		public function get created_by():String
		{
			return _created_by;
		}

		public function set created_by(value:String):void
		{
			_created_by = value;
		}

		public function get updated_at():Date
		{
			return _updated_at;
		}

		public function set updated_at(value:Date):void
		{
			_updated_at = value;
		}

		public function get created_at():Date
		{
			return _created_at;
		}

		public function set created_at(value:Date):void
		{
			_created_at = value;
		}

		public function get institution():Institution
		{
			return _institution;
		}

		public function set institution(value:Institution):void
		{
			_institution = value;
		}

		public function get title():String
		{
			return _title;
		}

		public function set title(value:String):void
		{
			_title = value;
		}
		
		public function get institution_name():String{						    
			return institution.name;
		}

		public function get description():String
		{
			return _description;
		}

		public function set description(value:String):void
		{
			_description = value;
		}


	}
}