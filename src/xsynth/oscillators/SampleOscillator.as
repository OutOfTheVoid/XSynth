package XSynth.oscillators
{
	import XSynth.data.ISample;
	
	public class SampleOscillator implements IOscillator
	{
		
		private var s_spl:ISample;
		
		private var f_div:Number;
		private var p_num:Number;
		
		private var s_rat:Number;
		
		public function SampleOscillator ( sample:ISample, frequencey:Number = 440, phase:Number = 0 )
		{
			
			s_spl = sample;
			
			f_div = frequencey;
			p_num = phase;
			
		}
		
		public final function ValueAt ( index:Number ) : Number
		{
			
			return s_spl.ValueAt ( ( ( index * f_div / s_rat ) + p_num ) % 1 );
			
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
		
		public final function SetSampleRate ( rate:uint ) : void
		{
			
			s_rat = rate;
			
		}
		
	}
	
}