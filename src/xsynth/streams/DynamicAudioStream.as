/*
XSynth audio synthesis library
© Liam Taylor 2012

Dynamic Audio Stream:
An output stream that plays directly to the flash sound API
can be dynamically changed while playing
*/
package xsynth.streams
{
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.SampleDataEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.utils.ByteArray;
	
	import xsynth.generators.IGenerator;
	
	public class DynamicAudioStream implements IOutputStream
	{
		
		private var s_out:Sound;
		private var a_gen:Vector.<IGenerator>;
		private var a_num:uint;
		private var s_siz:uint;
		private var c_spl:int;
		private var s_chn:SoundChannel;
		private var p_stt:Boolean;
		
		public final function DynamicAudioStream ( sampleDataSize:uint = 8192 )
		{
			
			s_siz = sampleDataSize;
			
			a_gen = new Vector.<IGenerator> ();
			
			s_out = new Sound ();
			s_out.addEventListener ( SampleDataEvent.SAMPLE_DATA, GetAudio );
			
			p_stt = false;
			
		}
		
		public final function AddGenerator ( generator:IGenerator ) : void
		{
			
			a_gen.push ( generator );
			
		}
		
		public final function Start ( samples:int = -1 ) : void
		{
			
			c_spl = samples;
			s_chn = s_out.play ();
			s_chn.addEventListener ( Event.SOUND_COMPLETE, iStop );
			p_stt = true;
			
		}
		
		private final function iStop ( E:Event ) : void
		{
			
			s_chn.removeEventListener ( Event.SOUND_COMPLETE, iStop );
			p_stt = false;
			
		}
		
		public final function Stop () : void
		{
			
			trace ( "Stream stopped" );
			
			if ( s_chn != null )
				s_chn.stop ();
			p_stt = false;
			
		}
		
		public final function IsPlaying () : Boolean
		{
			
			return p_stt;
			
		}
		
		public final function GetAudio ( S:SampleDataEvent ) : void
		{
			
			if ( c_spl == 0 )
				Stop ();
			else if ( c_spl > 0 )
				c_spl --;
			
			a_num = a_gen.length;
			
			var val:Number;
			var index:Number;
			
			var gi:uint;
			var si:uint = 0;
			
			while ( si < s_siz )
			{
				
				val = 0;
				
				index = si + S.position;
				
				gi = 0;
				while ( gi < a_num )
				{
					
					val += a_gen [ gi ].Data ( index );
					gi ++;
					
				}
				
				S.data.writeFloat ( val );
				S.data.writeFloat ( val );
				
				si ++;
				
			}
			
		}
		
	}
	
}