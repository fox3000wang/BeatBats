package model
{
	import org.robotlegs.mvcs.Actor;
	
	public class AvatarModel extends Actor
	{
		static public const SPEED:int = 3; 		
		
		private var _hp:int;
		private const MAX_HP:int = 5;
		
		public var targetX:int;
		public var targetY:int;
		
		public function AvatarModel()
		{
			super();
		}
		
		public function reset():void
		{
			_hp = MAX_HP;
		}
		
		public function get hp():int
		{
			return _hp;
		}
		
		public function hurt():void
		{
			if(_hp > 0)
				_hp--;
		}
		
		public function get isDie():Boolean
		{
			return _hp <= 0
		}
	}
}