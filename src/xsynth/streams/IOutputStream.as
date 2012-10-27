package xsynth.streams
{
	
	import xsynth.generators.IGenerator;
	
	public interface IOutputStream
	{
		
		function AddGenerator ( generator:IGenerator ) : void;
		function Start ( samples:int = -1 ) : void;
		function Stop () : void;
		function IsPlaying () : Boolean;
		
	}
	
}