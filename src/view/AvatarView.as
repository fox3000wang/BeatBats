package view
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	public class AvatarView extends Sprite
	{
		private var loader:Loader = new Loader();
		private var _avatar:*;
		
		
		public function AvatarView()
		{
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, initialize);
			loader.loadBytes(new EmbedResource.avatarClass);
			super();
		}
		
		private function initialize(e:Event):void
		{
			var clazz:* = loader.contentLoaderInfo.applicationDomain.getDefinition("idle");
			_avatar = new clazz;
			addChild(_avatar);
			dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function hurt():void
		{
			x -= 20;
			alpha = 0.5;
			setTimeout(function():void{	alpha = 1; }, 1000);
		}
		
		public function fire():void
		{
			_avatar["gun"].gotoAndStop(2);
			setTimeout(stopFire, 700);
		}
		
		public function stopFire():void
		{
			_avatar["gun"].gotoAndStop(1);
		}
		
		public function get isFiring():Boolean
		{
			return _avatar["gun"].currentFrame == 2;
		}
		
		public function get gunX():int
		{
			return x + _avatar["gun"].x + 20;
		}
		
		public function get gunY():int
		{
			return y + _avatar["gun"].y;
		}
	}
}