package controller
{
	import model.AvatarModel;
	import model.SceneModel;
	
	import org.robotlegs.mvcs.Command;
	
	import view.AvatarView;
	import view.PopupView;
	import view.SceneMediator;
	import view.SceneView;
	
	public class BaseCommand extends Command
	{
		[Inject]
		public var avatar:AvatarView;
		
		[Inject]
		public var sceneView:SceneView;
		
		[Inject]
		public var sceneModel:SceneModel;
		
		[Inject]
		public var avatarModel:AvatarModel;

		[Inject]
		public var popupView:PopupView;
		
	}
}