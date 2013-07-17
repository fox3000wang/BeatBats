package controller
{
	import model.SceneModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class RestartCommand extends BaseCommand
	{
		override public function execute():void
		{
			sceneModel.reset();
			avatarModel.reset();
			sceneView.reset()
			popupView.reset();
			
			contextView.addChild(sceneView);
			sceneView.frontLayer.addChild(popupView);

			sceneView.progressBar.gotoAndStop(1);
			sceneView.gameLayer.addChild(avatar);
			avatar.x = 50;
			avatar.y = 200;
			
		}
	}
}