/*
XSynth audio synthesis library
© Liam Taylor 2012

XSynth Rate Dependant Interface:
An interface used to describe any object which is dependant on the sample rate in order to accurateley caulculate.
*/
package xsynth
{
	 
	public interface IXSRateDependant
	{
		
		function SetSampleRate ( rate:uint ) : void; 
		
	}
	
}