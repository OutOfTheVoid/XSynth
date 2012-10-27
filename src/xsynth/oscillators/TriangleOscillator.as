/*
XSynth audio synthesis library
© Liam Taylor 2012

Sawtooth Oscillator:
An oscillator used to create a triangle wave
*/
package xsynth.oscillators
{
	
	public class TriangleOscillator implements IOscillator
	{
		
		private var f_div:Number;
		private var p_num:Number;
		
		public function TriangleOscillator ( frequencey:Number = 440, phase:Number = 0 )
		{
			
			f_div = frequencey;
			p_num = phase + 0.75;
			
		}
		
		public final function ValueAt ( index:Number ) : Number
		{
			
			var v:Number = ( ( p_num + ( index * f_div / 44100 ) ) % 1 ) * -4 + 2;
			v = ( v > 0 ) ? v : -v;
			-- v;
			return v;
			
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
			
			p_num = phase + 0.75;
			
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
			
			return p_num - 0.75;
			
		}
		
	}
	
}