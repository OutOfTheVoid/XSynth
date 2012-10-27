package xsynth.generators
{
	
	import xsynth.generators.IGenerator;
	import xsynth.oscillators.IOscillator;
	import xsynth.oscillators.TriangleOscillator;
	import xsynth.oscillators.SineOscillator;
	import xsynth.oscillators.SquareOscillator;
	
	public class TestGenerator implements IGenerator
	{
		
		private var l_num:Number;
		private var p_osc:IOscillator;
		
		public function TestGenerator ()
		{
			
			p_osc = new SquareOscillator ( 440 );
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
		
	}
	
}