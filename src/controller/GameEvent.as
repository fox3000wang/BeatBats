package controller
{
	import flash.events.DataEvent;
	
	public class GameEvent extends DataEvent
	{
		public static const START:String = "start";
		
		public static const RESTART:String = "restart";
		
		public static const GAME_OVER:String = "game_over";
		
		public function GameEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false, data:String="")
		{
			super(type, bubbles, cancelable, data);
		}
	}
}