/*
WARNING - Under development, not suited for anything besides curiosity.
*/
package xsynth.generators
{
	
	import xsynth.oscillators.IOscillator;
	
	public class StepSequencerGenerator implements IGenerator
	{
		
		private var w_osc:IOscillator;
		private var f_arr:Vector.<Number>;
		
		public function StepSequencerGenerator ( osc:IOscillator, freqs:Vector.<Number> )
		{
			
			w_osc = osc;
			f_arr = freqs;
			
		}
		
		public function Data ( index:Number ) : Number
		{
			
			w_osc.SetFrequencey ( f_arr [ ( Math.floor( index / 5000 ) % f_arr.length ) ] );
			return w_osc.ValueAt ( index );
			
		}
		
		public function get Level () : Number
		{
			
			return 1;
			
		}
		
		public function SetSampleRate ( rate:uint ) : void
		{
			
			w_osc.SetSampleRate ( rate );
			
		}
		
	}
	
}
