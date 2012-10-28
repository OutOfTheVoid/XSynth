/*
XSynth audio synthesis library
© Liam Taylor 2012

Flat Oscillator:
A faux oscillator used to create a flat signal
*/
package XSynth.oscillators
{
	
	public class FlatOscillator implements IOscillator
	{
		
		private var l_num:Number;
		
		public function FlatOscillator ( level:Number = 1 )
		{
			
			l_num = level;
			
		}
		
		public final function ValueAt ( index:Number ) : Number
		{
			
			return l_num;
			
		}
		
		public final function SetFrequencey ( frequencey:Number ) : void {};
		
		public final function SetPeriod ( periodMS:Number ) : void {};
		
		public final function SetPhase ( phase:Number ) : void {};
		
		public final function GetFrequencey () : Number
		{
			
			return 1;
			
		}
		
		public final function GetPeriodMS () : Number
		{
			
			return 1;
			
		}
		
		public final function GetPhase () : Number
		{
			
			return 0;
			
		}
		
		public final function SetSampleRate ( rate:uint ) : void {};
		
	}
	
}