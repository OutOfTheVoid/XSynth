/*
XSynth audio synthesis library
© Liam Taylor 2012

Generator Interface:
An interface to define the standard used for Generator instances for use by streams
*/
package xsynth.generators
{
	
	public interface IGenerator
	{
		
		function Data ( index:Number ) : Number;
		function get Level () : Number;
		
	}
	
}