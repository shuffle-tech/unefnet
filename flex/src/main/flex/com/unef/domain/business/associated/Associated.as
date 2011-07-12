package com.unef.domain.business.associated
{
	
	import com.unef.domain.base.model.BaseModel;
	import com.unef.domain.business.address.Address;
	import com.unef.domain.business.phone.Phone;
	import com.unef.domain.business.responsible.Responsible;
	import com.unef.domain.business.users.User;
	
	import mx.controls.Alert;
	import mx.formatters.DateFormatter;
	import mx.utils.ObjectUtil;
	import mx.utils.StringUtil;

	[Bindable]
	[RemoteClass(alias="Associated")]
	public class Associated extends User
	{
		public var picture:String;

	}
}