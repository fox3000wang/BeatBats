package
{
	import controller.GameEvent;
	import controller.GameOverCommand;
	import controller.RestartCommand;
	import controller.StartCommand;
	
	import flash.display.DisplayObjectContainer;
	
	import model.AvatarModel;
	import model.SceneModel;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	import view.AvatarMediator;
	import view.AvatarView;
	import view.PopupMediator;
	import view.PopupView;
	import view.SceneMediator;
	import view.SceneView;
	
	public class BeatBatsContext extends Context
	{
		public function BeatBatsContext(contextView:DisplayObjectContainer)
		{
			super(contextView);
		}
		
		override public function startup():void
		{
			commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, StartCommand, ContextEvent, true);
			commandMap.mapEvent(GameEvent.RESTART, RestartCommand, GameEvent);
			commandMap.mapEvent(GameEvent.GAME_OVER, GameOverCommand, GameEvent, true);
			//commandMap.mapEvent(GameEvent.LOSE, LoseCommand, GameEvent);
			//commandMap.mapEvent(GameEvent.WIN, WinCommand, GameEvent, true);
			
			injector.mapSingleton(AvatarModel);
			injector.mapSingleton(AvatarView);
			injector.mapSingleton(SceneModel);
			injector.mapSingleton(SceneView);
			injector.mapSingleton(PopupView);
			
			injector.mapSingleton(SoundCtrler);
			
			mediatorMap.mapView(AvatarView, AvatarMediator);
			mediatorMap.mapView(SceneView, SceneMediator);
			mediatorMap.mapView(PopupView, PopupMediator);
		
			super.startup();
		}
		
		override public function shutdown():void
		{
			
		}
		
	}
}