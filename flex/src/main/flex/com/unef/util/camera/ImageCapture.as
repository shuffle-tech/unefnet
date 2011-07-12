package com.unef.util.camera
{
	import flash.media.Camera;
	
	import mx.controls.VideoDisplay;
	import mx.events.FlexEvent;
	
	public class ImageCapture extends VideoDisplay
	{
		protected var _camera:Camera; 
		
		public function ImageCapture()
		{
			super();
		}
		
		override protected function initializationComplete():void{
			super.initializationComplete();
			addEventListener(FlexEvent.CREATION_COMPLETE,setUpCamera,false,0,true);
		}
		
		public function get camera():Camera{
			if (null == _camera){
				_camera = Camera.getCamera();
			}
			return _camera;
		}
		
		protected function setUpCamera(event:FlexEvent):void
		{
			attachCamera(camera);
		}
	}
}