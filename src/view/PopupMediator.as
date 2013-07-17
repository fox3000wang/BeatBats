package view
{
	import controller.GameEvent;
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class PopupMediator extends Mediator
	{
		[Inject]
		public var help:PopupView;
		
		[Inject]
		public var soundCtrler:SoundCtrler;
		
		[Inject]
		public var scene:SceneView;
		
		override public function onRegister():void
		{
			eventMap.mapListener(help.startBtn,   MouseEvent.CLICK, startGame);
			eventMap.mapListener(help.restartBtn, MouseEvent.CLICK, startGame);
		}
		
		private function startGame(e:Event):void
		{
			e.stopImmediatePropagation();
			dispatch(new GameEvent(GameEvent.RESTART));
			
			if(scene.musicBtn.currentFrame == 1)
				soundCtrler.sceneSoundCtrl.playSound();
		}
	}
}