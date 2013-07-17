package controller
{
	import view.PopupView;

	public class StartCommand extends BaseCommand
	{
		override public function execute():void
		{
			contextView.addChild(popupView);
		}
	}
}