package xsynth.oscillators
{
	
	public class SquareOscillator implements IOscillator
	{
		
		private static const PI2:Number = Math.PI * 2;
		
		private var f_div:Number;
		private var p_num:Number;
		private var w_num:Number;
		
		public function SquareOscillator ( frequencey:Number = 440, phase:Number = 0, pulseWidth:Number = 0.5 )
		{
			
			f_div = frequencey;
			p_num = phase;
			w_num = pulseWidth;
			
		}
		
		public final function ValueAt ( index:Number ) : Number
		{
			
			return ( ( ( p_num + ( index * f_div / 44100 ) ) % 1 ) < w_num ) ? 1 : -1;
			
		}
		
		public final function SetFrequencey ( frequencey:Number ) : void
		{
			
			f_div = frequencey;
			
		}
		
		public final function SetPeriod ( periodMS:Number ) : void
		{
			
			f_div = 1000 / periodMS;
			
		}
		
		public final function SetPhase ( phase:Number ) : void
		{
			
			p_num = phase;
			
		}
		
		public final function GetFrequencey () : Number
		{
			
			return f_div;
			
		}
		
		public final function GetPeriodMS () : Number
		{
			
			return 0.001 / f_div;
			
		}
		
		public final function GetPhase () : Number
		{
			
			return p_num;
			
		}
		
	}
	
}