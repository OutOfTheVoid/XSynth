package XSynth.envelopes
{
	
	public class ConstantEnvelope implements IEnvelope
	{
		
		private var val:Number;
		
		public function ConstantEnvelope ( value:Number )
		{
			
			val = value;
			
		}
		
		public function SetStart ( index:uint ) : void
		{
			
			return;
		
		};
		
		
		public function GetLevel ( index:uint ) : Number
		{
			
			return val;
			
		}
		
		public function AtEnd ( index:uint ) : Boolean
		{
			
			return true;
			
		}
		
	}
	
}