package xsynth.envelopes
{
	
	public class LinearADSREnvelope implements IEnvelope
	{
		
		private var strl:Number
		private var atkt:uint;
		private var atkl:Number;
		private var dcyt:uint;
		private var dcyl:Number;
		private var sstt:uint;
		private var sstl:Number;
		private var rlst:uint;
		private var rlsl:Number;
		
		private var ofst:uint;
		
		public function LinearADSREnvelope ( startLevel:Number, attackTime:uint, attackLevel:Number, decayTime:uint, decayLevel:Number, sustainTime:uint, sustainLevel:Number, releaseTime:uint, releaseLevel:Number, offset:uint )
		{
			
			strl = startLevel;
			atkt = attackTime;
			atkl = attackLevel;
			dcyt = decayTime;
			dcyl = decayLevel;
			sstt = sustainTime;
			sstl = sustainLevel;
			rlst = releaseTime;
			rlsl = releaseLevel;
			
			ofst = offset;
			
		}
		
		public function SetStart ( index:uint ) : void
		{
			
			ofst = index;
			
		}
		
		public function GetLevel ( index:uint ) : Number
		{
			
			if ( index < ofst )
				return strl;
			
			index -= ofst;
			
			if ( index < atkt )
				return strl + ( atkl - strl ) * ( index / atkt );
			index -= atkt;
			if ( index < dcyt )
				return atkl + ( dcyl - atkl ) * ( index / atkt );
			index -= dcyt;
			if ( index < sstt )
				return dcyl + ( sstl - dcyl ) * ( index / sstt );
			index -= sstt;
			if ( index < rlst )
				return sstl + ( rlsl - sstl ) * ( index / rlst );
			
			return strl;
			
		}
		
		public function AtEnd ( index:uint ) : Boolean
		{
			
			return index < ofst + atkt + dcyt + sstt + rlst;
			
		}
		
	}
	
}