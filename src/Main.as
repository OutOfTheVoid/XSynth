/*
Demo application:
plays an alternating sine wave and square wave.
*/
package
{
	
	import XSynth.generators.CombinedGenerator;
	import XSynth.generators.FlatWaveGenerator;
	import XSynth.oscillators.SineOscillator;
	import XSynth.oscillators.SquareOscillator;
	import XSynth.streams.DynamicAudioStream;
	
	import flash.display.Sprite;
	
	public class Main extends Sprite
	{
		
		private var ostream:DynamicAudioStream;
		
		private var sineOsc:SineOscillator;
		private var squareOsc:SquareOscillator;
		
		private var wave1:FlatWaveGenerator;
		private var wave2:FlatWaveGenerator;
		private var wave3:FlatWaveGenerator;
		private var wave4:FlatWaveGenerator;
		
		private var variOsc1:SquareOscillator;
		private var variOsc2:SquareOscillator;
		
		private var mulGen1:CombinedGenerator;
		private var mulGen2:CombinedGenerator;
		
		public function Main ()
		{
			
			ostream = new DynamicAudioStream ( 8192 );
			
			sineOsc = new SineOscillator ( 523.25, 0 ); // Sine oscillator at 523.25 Hz, or C5
			squareOsc = new SquareOscillator ( 783.99, 0, 0.5 ); // Square wave oscillator at 783.99 Hz, or G5
			
			wave1 = new FlatWaveGenerator ( sineOsc, 0.25, 0 );
			wave2 = new FlatWaveGenerator ( squareOsc, 0.25, 0 );
			
			variOsc1 = new SquareOscillator ( 0.5, 0, 0.5 );   //Phase: 0     ( Both at 1/2 Hz )
			variOsc2 = new SquareOscillator ( 0.5, 0.5, 0.5 ); //Phase: 0.5 
			
			wave3 = new FlatWaveGenerator ( variOsc1, 0.5, 0.5 ); // Level of 0.5 and offset of 0.5 gives us a range of [0 to 1] from a range of [-1 to 1]
			wave4 = new FlatWaveGenerator ( variOsc2, 0.5, 0.5 );
			
			mulGen1 = new CombinedGenerator ( CombinedGenerator.MULTIPLICATIVE, wave1, wave3 ); // Multiply the waves by the alternating 0s and 1s
			mulGen2 = new CombinedGenerator ( CombinedGenerator.MULTIPLICATIVE, wave2, wave4 );
			
			ostream.AddGenerator ( mulGen1 ); // Add generators to the stream for playback
			ostream.AddGenerator ( mulGen2 );
			
			ostream.BrodcastRate ();
			ostream.Start (); // Start playing
			
		}
		
	}
	
}