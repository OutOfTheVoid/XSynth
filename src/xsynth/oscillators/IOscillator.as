package xsynth.oscillators
{
	
	public interface IOscillator
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