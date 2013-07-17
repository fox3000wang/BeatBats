package view
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	public class SceneView extends Sprite
	{
		
		private var _scene:*;
		
		public function SceneView()
		{
			super();
			_scene = new EmbedResource.sceneClass;
			addChild(_scene);
			musicBtn.gotoAndStop(1);
		}
		
		public function reset():void
		{
			while(gameLayer.numChildren > 0)
				gameLayer.removeChildAt(0);
		}
		
		public function get cloudLayer():MovieClip
		{
			return _scene['cloudLayer'];
		}
		
		public function get frontLayer():MovieClip
		{
			return _scene["fg"];
		}
		
		public function get gameLayer():MovieClip
		{
			return _scene["mg"];
		}
		
		public function get musicBtn():MovieClip
		{
			return frontLayer['btnMute'];
		}
		
		public function get exitBtn():DisplayObject
		{
			return frontLayer['btnExit'];
		}
		
		public function get avatarHp():MovieClip
		{
			return frontLayer['avatarHp'];
		}
		
		public function get progressBar():MovieClip
		{
			return frontLayer['progressBar'];
		}
		
	}
}