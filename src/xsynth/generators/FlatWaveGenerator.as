/*
XSynth audio synthesis library
© Liam Taylor 2012

Flat Wave Generator:
Generator used to play an un-altered generic wave from an oscilator instance
*/
package xsynth.generators
{
	import xsynth.oscillators.IOscillator;
	
	public class FlatWaveGenerator implements IGenerator
	{
		
		private var w_osc:IOscillator;
		private var l_num:Number;
		
		public function FlatWaveGenerator ( oscillator:IOscillator, level:Number )
		{
			
			w_osc = oscillator;
			l_num = level;
			
		}
		
		public function Data ( i:Number ) : Number
		{
			
			return w_osc.ValueAt ( i ) * l_num;
			
		}
		
		public function get Level () : Number { return l_num };
		
	}
	
}