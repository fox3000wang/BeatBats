package controller
{
	public class GameOverCommand extends BaseCommand
	{
		override public function execute():void
		{
			//contextView.removeChild(popupView);
			contextView.removeChild(sceneView);
		}
	}
}