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
		private var o_num:Number;
		
		public function FlatWaveGenerator ( oscillator:IOscillator, level:Number, offset:Number = 0 )
		{
			
			w_osc = oscillator;
			l_num = level;
			o_num = offset;
			
		}
		
		public function Data ( i:Number ) : Number
		{
			
			return w_osc.ValueAt ( i ) * l_num + o_num;
			
		}
		
		public function get Level () : Number { return l_num }
		
		public final function SetSampleRate ( rate:uint ) : void
		{
			
			w_osc.SetSampleRate ( rate );
			
		}
		
	}
	
}
