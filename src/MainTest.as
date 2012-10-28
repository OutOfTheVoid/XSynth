package
{
	import XSynth.generators.FlatWaveGenerator;
	import XSynth.generators.MultiGenerator;
	import XSynth.oscillators.SineOscillator;
	import XSynth.streams.DynamicAudioStream;
	
	import flash.display.Sprite;
	
	public class MainTest extends Sprite
	{
		
		private var sin1:SineOscillator = new SineOscillator ( 261.63, 0 );
		private var sin2:SineOscillator = new SineOscillator ( 329.63, 0 );
		private var sin3:SineOscillator = new SineOscillator ( 392.00, 0 );
		
		private var swgn1:FlatWaveGenerator = new FlatWaveGenerator ( sin1, 1, 0 );
		private var swgn2:FlatWaveGenerator = new FlatWaveGenerator ( sin2, 1, 0 );
		private var swgn3:FlatWaveGenerator = new FlatWaveGenerator ( sin3, 1, 0 );
		
		private var mgen:MultiGenerator = new MultiGenerator ( MultiGenerator.ADDATIVE_MEAN );
		
		private var ostm:DynamicAudioStream = new DynamicAudioStream ( 8192 );
		
		public function MainTest ()
		{
			
			mgen.AddGenerator ( swgn1 );
			mgen.AddGenerator ( swgn2 );
			mgen.AddGenerator ( swgn3 );
			
			ostm.AddGenerator ( mgen );
			
			ostm.BrodcastRate ();
			ostm.Start ( -1 );
			
		}
		
	}
	
}