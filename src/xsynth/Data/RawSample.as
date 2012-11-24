package XSynth.data
{
	import flash.utils.ByteArray;
	
	public class RawSample implements ISample, IWritableSample
	{
		
		private var d_arr:ByteArray;
		private var l_num:uint;
		
		public function RawSample ( length:uint = 1024 )
		{
			
			d_arr = new ByteArray ();
			//d_arr.length = length;
			l_num = length;
			
		}
		
		public function DefineByFunction ( func:Function, scale:Number = 1 ) : void
		{
			
			d_arr.position = 0;
			for ( var i:uint = 0; i < l_num; i ++ )
			{
				
				d_arr.position = i * 8;
				d_arr.writeDouble ( func ( i / l_num * scale ) );
			
			}
			
		}
		
		public function EditData ( index:uint, value:Number ) : void
		{
			
			if ( index >= l_num )
				throw "Error editing sample: Index out of range.";
			
			d_arr.position = index * 8;
			d_arr.writeDouble ( value );
			
		}
		
		public function DataAt ( index:uint ) : Number
		{
			
			if ( index >= l_num )
				throw "Error editing sample: Index out of range.";
			
			d_arr.position = index * 8;
			
			return d_arr.readDouble ();
			
		}
		
		public function ValueAt ( index:Number ) : Number
		{
			
			if ( index < 0 )
				index = -index;
			
			if ( index > 1 )
				index %= 1;
			
			d_arr.position = Math.floor ( index * l_num ) * 8;
			return d_arr.readDouble ();
			
		}
		
		public function get dataLength () : uint
		{
			
			return l_num * 8;
			
		}
		
	}
	
}