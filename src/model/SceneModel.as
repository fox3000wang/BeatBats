package model
{

	import org.robotlegs.mvcs.Actor;

	public class SceneModel extends Actor
	{
		public var bulletPool:Array;
		public var batPool:Array;
		
		public var currentTime:int = 0;
		public const totalTime:int = 45;
		
		public var gameOver:Boolean = false;
		
		public function SceneModel()
		{
			super();
		}
		
		public function reset():void
		{
			bulletPool = [];
			batPool = [];
			
			currentTime = 0;
			gameOver = false;
		}

	}
}