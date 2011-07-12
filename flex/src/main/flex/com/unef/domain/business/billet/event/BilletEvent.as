package com.unef.domain.business.billet.event
{
	import com.unef.domain.business.billet.Billet;
	
	import flash.events.Event;
	
	
	public class BilletEvent extends Event
	{
		public static const VISUALIZE_BILLET:String = "visualizeBillet";
		public static const CANCEL_BILLET:String = "cancelBillet";
		public static const TO_WRITE_OFF_BILLET:String = "toWriteOffBillet";
		public static const GENERATE_BILLET:String = "generateBillet";
		public static const GENERATE_BATCH_BILLET:String = "generateBatchBillet";
		public static const START_BILLET_GENERATION:String = "startBilletGeneration";
		public static const BILLET_GENERATION_COMPLETE:String = "billetGenerationComplete";
		public static const BILLET_BATCH_GENERATION_COMPLETE:String = "billetBatchGenerationComplete";
		public static const BILLET_CANCELLATION_COMPLETE:String = "billetCancellationComplete";
		
		private var _billet:Billet;
		
		public function BilletEvent(type:String)
		{
			super(type);
		}
		
		
		override public function clone():Event{
			return new BilletEvent(type);
		}

		public function get billet():Billet
		{
			return _billet;
		}

		public function set billet(value:Billet):void
		{
			_billet = value;
		}

	}
}