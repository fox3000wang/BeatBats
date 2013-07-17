package view
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class BatView extends Sprite
	{
		
		private var _bat:*;
		
		public function BatView()
		{
			super();
			_bat = new EmbedResource.batClass;
			addChild(_bat);
			idle();
		}
		
		public function hurt():void
		{
			_bat.gotoAndStop(2);
		}
		
		public function idle():void
		{
			_bat.gotoAndStop(1);
		}
	}
}