/*
XSynth audio synthesis library
© Liam Taylor 2012

Sawtooth Oscillator:
An oscillator used to create a sine wave
*/
package xsynth.oscillators
{
	
	public class SineOscillator implements IOscillator
	{
		
		private static const PI2:Number = Math.PI * 2;
		
		private var f_div:Number;
		private var p_num:Number;
		
		private var s_rat:Number;
		
		public function SineOscillator ( frequencey:Number = 440, phase:Number = 0 )
		{
			
			f_div = frequencey;
			p_num = phase;
			
		}
		
		public final function ValueAt ( index:Number ) : Number
		{
			
			return Math.sin ( p_num + PI2 * ( index * f_div / s_rat ) );
			
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
			
			p_num = phase * PI2;
			
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
			
			return p_num / PI2;
			
		}
		
		public final function SetSampleRate ( rate:uint ) : void
		{
			
			s_rat = rate;
			
		}
		
	}
	
}