package XSynth.generators
{
	
	public final class MultiGenerator implements IGenerator
	{
		
		public static const ADDATIVE_FLAT:uint = 0;
		public static const ADDATIVE_MEAN:uint = 1;
		public static const MULTIPLICATIVE:uint = 2;
		
		public var g_arr:Vector.<IGenerator>;
		
		private var c_fnc:Function;
		
		public final function MultiGenerator ( mode:uint )
		{
			
			g_arr = new Vector.<IGenerator> ();
			SetMode ( mode );
			
		};
		
		public final function SetMode ( mode:uint ) : void
		{
			
			switch ( mode )
			{
				
				case ADDATIVE_FLAT:
					c_fnc = AddFlat;
					break;
				
				case ADDATIVE_MEAN:
					c_fnc = AddMean;
					break;
				
				case MULTIPLICATIVE:
					c_fnc = Multiply;
					break;
				
				default:
					c_fnc = AddFlat;
					break;
				
			}
			
		}
		
		public final function Data ( index:Number ) : Number
		{
			
			return c_fnc ( index );
			
		}
		
		public final function AddGenerator ( generator:IGenerator ) : void
		{
			
			g_arr.push ( generator );
			
		}
		
		public final function RemoveGenerator ( generator:IGenerator ) : void
		{
			
			var id:int = g_arr.indexOf ( generator );
			if ( id != -1 )
				g_arr.splice ( id, 1 );
			
		}
		
		private final function AddFlat ( index:Number ) : Number
		{
			
			var v:Number = 0;
			var i:uint = 0;
			var l:uint = g_arr.length;
			
			while ( i < l )
			{
				
				v += g_arr [ i ].Data ( index );
				i ++;
				
			}
			
			return v;
			
		};
		
		private final function AddMean ( index:Number ) : Number
		{
			
			var v:Number = 0;
			var i:uint = 0;
			var l:uint = g_arr.length;
			
			while ( i < l )
			{
				
				v += g_arr [ i ].Data ( index );
				i ++;
				
			}
			
			return v / l;
			
		};
		
		private final function Multiply ( index:Number ) : Number
		{
			
			var v:Number = 1;
			var i:uint = 0;
			var l:uint = g_arr.length;
			
			while ( i < l )
			{
				
				v *= g_arr [ i ].Data ( index );
				i ++;
				
			}
			
			return ( l != 0 ) ? v : 0;
			
		};
		
		public final function get Level ():Number { return 1 };
		
		public final function SetSampleRate ( rate:uint ) : void
		{
			
			for ( var i:uint = 0; i < g_arr.length; i ++ )
				g_arr [ i ].SetSampleRate ( rate );
			
		};
		
	}
	
}