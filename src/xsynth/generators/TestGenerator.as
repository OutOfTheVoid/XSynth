/*
XSynth audio synthesis library
© Liam Taylor 2012

Test Generator:
A Generator used generate a test tone. ( 440 A at peak-to-peak level )
*/
package XSynth.generators
{
	
	import XSynth.generators.IGenerator;
	import XSynth.oscillators.IOscillator;
	import XSynth.oscillators.TriangleOscillator;
	import XSynth.oscillators.SineOscillator;
	import XSynth.oscillators.SquareOscillator;
	
	public class TestGenerator implements IGenerator
	{
		
		private var l_num:Number;
		private var p_osc:IOscillator;
		
		public function TestGenerator ()
		{
			
			p_osc = new SineOscillator ( 440 );
			l_num = 1;
			
		}
		
		public final function Data ( i:Number ) : Number
		{
			
			return p_osc.ValueAt ( i ) * l_num;
			
		}
		
		public function get Level () : Number
		{
			
			return l_num;
			
		}
		
		public final function SetSampleRate ( rate:uint ) : void
		{
			
			p_osc.SetSampleRate ( rate );
			
		}
		
	}
	
}