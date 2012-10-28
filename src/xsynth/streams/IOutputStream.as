/*
XSynth audio synthesis library
© Liam Taylor 2012

Output Stream Interface:
An interface to describe the standard for output streams
*/
package XSynth.streams
{
	
	import XSynth.IXSRateDependant;
	import XSynth.generators.IGenerator;
	
	public interface IOutputStream extends IXSRateDependant
	{
		
		function AddGenerator ( generator:IGenerator ) : void;
		function Start ( samples:int = -1 ) : void;
		function Stop () : void;
		function IsPlaying () : Boolean;
		function CurrentSampleIndex () : Number;
		
	}
	
}