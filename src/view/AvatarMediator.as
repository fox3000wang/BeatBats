package view
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import model.AvatarModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class AvatarMediator extends Mediator
	{
		
		[Inject]
		public var avatar:AvatarView;
		
		[Inject]
		public var avatarModel:AvatarModel;

		public function AvatarMediator()
		{
			super();
		}
		
		override public function onRegister():void
		{
			eventMap.mapListener(avatar.stage, MouseEvent.MOUSE_MOVE, updateTarget);
			eventMap.mapListener(avatar.stage, Event.ENTER_FRAME, onMove);
		}
		
		private function updateTarget(e:MouseEvent):void
		{
			avatarModel.targetX = e.stageX;
			avatarModel.targetY = e.stageY;
		}
		
		private function onMove(e:Event):void
		{
			if(Math.abs(avatarModel.targetX - avatar.x) > 5)
				avatar.x += AvatarModel.SPEED * (avatarModel.targetX > avatar.x ? 1 : -1) 
	
			if(Math.abs(avatarModel.targetY - avatar.y) > 5)
				avatar.y += AvatarModel.SPEED * (avatarModel.targetY > avatar.y ? 1 : -1)
					
			if(avatarModel.hp <= 0 && avatar.parent)
				avatar.parent.removeChild(avatar);
					
			if(avatar.x < 50)  avatar.x = 50;
			if(avatar.x > 900) avatar.x = 900;
			
//			if(avatar.y < 100) avatar.y = 100;
//			if(avatar.y > 530) avatar.y = 530;
			if(avatar.y < 165) avatar.y = 165;
			if(avatar.y > 465) avatar.y = 465;
		}
		
	}
}