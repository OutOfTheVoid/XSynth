package xsynth.envelopes
{
	
	public interface IEnvelope
	{
		
		function SetStart ( index:uint ) : void;
		function GetLevel ( index:uint ) : Number;
		function AtEnd ( index:uint ) : Boolean;
		
	}
	
}