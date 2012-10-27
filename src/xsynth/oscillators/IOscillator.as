/*
XSynth audio synthesis library
© Liam Taylor 2012

Oscillator Interface:
An interface used to describe the standard for an oscillator.
*/
package XSynth.oscillators
{
	
	import XSynth.IXSRateDependant;
	
	public interface IOscillator extends IXSRateDependant
	{
		
		function ValueAt ( index:Number ) : Number;
		function SetFrequencey ( frequencey:Number ) : void;
		function SetPeriod ( periodMS:Number ) : void;
		function SetPhase ( phase:Number ) : void;
		
		function GetFrequencey () : Number;
		function GetPeriodMS () : Number;
		function GetPhase () : Number;
		
	}
	
}