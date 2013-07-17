package view
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.utils.setTimeout;
	
	import controller.GameEvent;
	
	import model.AvatarModel;
	import model.SceneModel;
	
	import org.robotlegs.mvcs.Mediator;
	
	public class SceneMediator extends Mediator
	{
		[Inject]
		public var scene:SceneView;
		
		[Inject]
		public var sceneModel:SceneModel;
		
		[Inject]
		public var avatar:AvatarView;
		
		[Inject]
		public var avatarModel:AvatarModel;
		
		[Inject]
		public var popuoView:PopupView;
		
		[Inject]
		public var soundCtrler:SoundCtrler;
		
		override public function onRegister():void
		{
			eventMap.mapListener(scene.stage, Event.ENTER_FRAME, onPlay);
			eventMap.mapListener(scene, MouseEvent.CLICK, onClick);
			eventMap.mapListener(scene.musicBtn, MouseEvent.CLICK, musiceClickHandler);
			eventMap.mapListener(scene.exitBtn, MouseEvent.CLICK, closeCtrl);
			setTimeout(timerHandler, 2000);
		}
		
		private function closeCtrl(e:Event):void
		{
			//(contextView as BaseVbuilderPuzzle).closeCtrl(e);
		}
		
		private function distory():void
		{
			dispatch(new GameEvent(GameEvent.GAME_OVER));
		}
		
		private function onPlay(e:Event):void
		{
			if(sceneModel.gameOver)
				return;
			
			for each(var bullet:* in sceneModel.bulletPool){
				bullet.x += 15;
				for each(var bat:* in sceneModel.batPool){
					if(checkBullet(bullet, bat))
						hitBat(bullet, bat);
				}
			}
			
			for each(bat in sceneModel.batPool){
				bat.x -= 10;
				if(checkBat(bat))
					hitAvatar(bat);
			}
			
			if(sceneModel.bulletPool.length > 0 && sceneModel.bulletPool[0].x > 960){
				destoryItem(sceneModel.bulletPool[0]);
			}
			
			if(sceneModel.batPool.length > 0 && sceneModel.batPool[0].x < 0){
				destoryItem(sceneModel.batPool[0]);
			}
			
			for(var i:int = 0; i < scene.cloudLayer.numChildren; i++){
				var cloud:* = scene.cloudLayer.getChildAt(i);
				cloud.x -= 0.5 * cloud.scaleX;
				if(cloud.x < -cloud.width)	
					cloud.x = 960;
			}
			scene.avatarHp.gotoAndStop(6 - avatarModel.hp);
		}
		
		private function removeFromArray(item:*):void
		{
			var index:int;
			index = sceneModel.batPool.indexOf(item);
			if (index > -1)
				sceneModel.batPool.splice(index, 1);
			index = sceneModel.bulletPool.indexOf(item);
			if (index > -1)
				sceneModel.bulletPool.splice(index, 1);
		}
		
		private function destoryItem(item:*):void
		{
			removeFromArray(item);
			if(item.parent)
				item.parent.removeChild(item);
		}
		
		private function checkBullet(bullet:DisplayObject, bat:BatView):Boolean
		{
			return Math.abs(bullet.x - bat.x) < 80 &&  Math.abs(bullet.y- bat.y) < 60;
		}
		
		private function checkBat(bat:BatView):Boolean
		{
			if(avatar.y > bat.y)
				return Math.abs(avatar.x - bat.x) < 140 &&  Math.abs(avatar.y- bat.y) < 160;	
			else
				return Math.abs(avatar.x - bat.x) < 140 &&  Math.abs(avatar.y- bat.y) < 120;
		}
		
		private function hitBat(bullet:DisplayObject, bat:BatView):void
		{
			destoryItem(bullet);
			removeFromArray(bat);
			bat.hurt();
			soundCtrler.hitSoundCtrl.playSound();
			setTimeout(function():void{
				destoryItem(bat);
			},500);
		}
		
		private function hitAvatar(bat:BatView):void
		{
			destoryItem(bat);
			avatar.hurt();
			avatarModel.hurt();
			soundCtrler.hurtSoundCtrl.playSound();
			if(avatarModel.isDie){
				soundCtrler.sceneSoundCtrl.stopSound();
				soundCtrler.loseSoundCtrl.playSound();
				sceneModel.gameOver = true;
				popuoView.lose();
			}
		}
		
		private function timerHandler():void
		{
			if(sceneModel)
				setTimeout(timerHandler, 1000);
			
			if(sceneModel.gameOver)
				return;
			
			if(sceneModel.currentTime >= sceneModel.totalTime){
				sceneModel.gameOver = true;
				popuoView.win();
				scene.reset();
				setTimeout(distory, 4000);
				soundCtrler.sceneSoundCtrl.stopSound();
				soundCtrler.successSoundCtrl.playSound();
				//(contextView as BaseVbuilderPuzzle).returnCtrl();
				return;	
			}
			
			sceneModel.currentTime++;
			
			scene.progressBar.gotoAndStop(sceneModel.currentTime);
			
			if(sceneModel.currentTime % 2 == 0){
				var bat:BatView = new BatView;
				
				scene.gameLayer.addChild(bat);
				sceneModel.batPool.push(bat);
				
				bat.y = avatar.y - 200 + Math.random() * 400;
				//if(bat.y < 100) bat.y = 100;
				if(bat.y < 165) bat.y = 165;
				//if(bat.y > 540)	bat.y = 540;
				if(bat.y > 465)	bat.y = 465;
				bat.x = 960;
			}
		}
		
		private function onClick(e:Event):void
		{
			if(!avatar.isFiring)
			{
				avatar.fire();
				setTimeout(function():void{
					var bullet:* = new EmbedResource.bulletClass;
					scene.gameLayer.addChild(bullet);
					sceneModel.bulletPool.push(bullet);
					bullet.x = avatar.gunX;
					bullet.y = avatar.gunY;
					soundCtrler.attackSoundCtrl.playSound();
				},700);
			}
		}
		
		private function musiceClickHandler(e:MouseEvent):void
		{
			if(scene.musicBtn.currentFrame == 1)
			{
				scene.musicBtn.gotoAndStop(2);
				soundCtrler.sceneSoundCtrl.stopSound(e);
			}
			else
			{
				scene.musicBtn.gotoAndStop(1);
				soundCtrler.sceneSoundCtrl.playSound(e);
			}
		}
		

	}
}