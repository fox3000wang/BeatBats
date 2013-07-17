package
{
	import flash.display.Sprite;
	
	[SWF(width="960", height="560", nodeRate="30", backgroundColor="#888888")]
	public class ola_BeatBats extends Sprite
	{
		protected var context:BeatBatsContext;
		
		public function ola_BeatBats()
		{
			context = new BeatBatsContext(this);
			super();
		}
		
	}
}