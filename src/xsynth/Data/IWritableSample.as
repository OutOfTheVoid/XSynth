package XSynth.data
{
	
	public interface IWritableSample
	{
		
		function EditData ( index:uint, value:Number ) : void;
		function get dataLength () : uint;
		
	}
	
}