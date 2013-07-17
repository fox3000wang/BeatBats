package view
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;

	public class PopupView extends Sprite
	{
		private var _help:*;
		private var _lose:*;
		private var _win:*;
		
		public function PopupView()
		{
			_help = new EmbedResource.helpClass;
			_lose = new EmbedResource.failedClass;
			_win =  new EmbedResource.successClass;
			addChild(_help);
		}
		
		public function reset():void
		{
			while(numChildren > 0)
				removeChildAt(0);
		}
		
		public function get startBtn():DisplayObject
		{
			return _help["startBtn"];
		}
		
		public function get restartBtn():DisplayObject
		{
			return _lose["restartBtn"];
		}
		
		public function lose():void
		{
			addChild(_lose);	
		}
		
		public function win():void
		{
			addChild(_win);
			_win["successmovie"].gotoAndPlay(1);
		}
	}
}