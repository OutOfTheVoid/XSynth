/*
XSynth audio synthesis library
© Liam Taylor 2012

Combination Generator:
Generator used to algorythmically combine two generators
*/
package XSynth.generators
{
	
	import XSynth.generators.IGenerator;
	
	public class CombinationGenerator implements IGenerator
	{
		
		public static const ADDATIVE_FLAT:uint = 1; // o = a + b
		public static const ADDATIVE_MEAN:uint = 2; // o = ( a + b ) / 2
		public static const MULTIPLICATIVE:uint = 3;// o = a * b
		public static const SUBTRACTIVE:uint = 4;   // o = a - b
		public static const DIVISITIVE:uint = 5;    // o = a / b
		
		private var c_fnc:Function;
		
		private var a_gen:IGenerator;
		private var b_gen:IGenerator;
		
		public function CombinationGenerator ( mode:uint, generatorA:IGenerator, generatorB:IGenerator )
		{
			
			a_gen = generatorA;
			b_gen = generatorB;
			
			switch ( mode )
			{
				case ADDATIVE_FLAT:
					c_fnc = AddFlat;
					break;
				case ADDATIVE_MEAN:
					c_fnc = AddMean;
					break;
				case MULTIPLICATIVE:
					c_fnc = Mul;
					break;
				case SUBTRACTIVE:
					c_fnc = Sub;
					break;
				case DIVISITIVE:
					c_fnc = Div;
					break;
				default:
					c_fnc = AddFlat;
					break;
				
			}
			
		}
		
		public function Data ( index:Number ) : Number
		{
			
			var va:Number = a_gen.Data ( index );
			var vb:Number = b_gen.Data ( index );
			
			return c_fnc ( va, vb );
			
		}
		
		private final function AddFlat ( a:Number, b:Number ) : Number {	return a + b;			}
		private final function AddMean ( a:Number, b:Number ) : Number {	return ( a + b ) / 2;	}
		private final function Mul ( a:Number, b:Number ) : Number {		return a * b;			}
		private final function Sub ( a:Number, b:Number ) : Number {		return a - b;			}
		private final function Div ( a:Number, b:Number ) : Number {		return a * b;			}
		
		public final function get Level ():Number { return 1 };
		
		
		
		public final function SetSampleRate ( rate:uint ) : void
		{
			
			a_gen.SetSampleRate ( rate );
			b_gen.SetSampleRate ( rate );
			
		}
		
	}
	
}