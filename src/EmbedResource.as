package 
{
	public class EmbedResource
	{
		[Embed(source = "assets/avatar/ola.swf", mimeType="application/octet-stream")]
		public static const avatarClass:Class;
		
		
		[Embed(source = "assets/chapter01/scene.swf", symbol="scene")]
		public static const sceneClass:Class;
		
		[Embed(source = "assets/chapter01/help.swf", symbol="help")]
		public static const helpClass:Class;
		
		[Embed(source = "assets/chapter01/failed.swf", symbol="failed")]
		public static const failedClass:Class;
		
		[Embed(source = "assets/chapter01/success.swf", symbol="success")]
		public static const successClass:Class;
		
		[Embed(source = "assets/chapter01/scene.swf", symbol="bullet")]
		public static const bulletClass:Class;
		

		[Embed(source = "assets/chapter01/bat.swf", symbol="bat")]
		public static const batClass:Class;
		
		
		
		[Embed(source = "assets/chapter01/sound.swf", symbol="scene_sound")]
		public static const sceneMusicClass:Class;
		
		[Embed(source = "assets/chapter01/sound.swf", symbol="success_sound")]
		public static const successMusicClass:Class;
		
		[Embed(source = "assets/chapter01/sound.swf",symbol="lose_sound")]
		public static const loseMusicClass:Class;
		
		[Embed(source = "assets/chapter01/sound.swf", symbol="hurt_sound")]
		public static const hurtSoundClass:Class;
		
		[Embed(source = "assets/chapter01/sound.swf", symbol="attack_sound")]
		public static const attackSoundClass:Class;
		
		[Embed(source = "assets/chapter01/sound.swf", symbol="hit_sound")]
		public static const hitSoundClass:Class;
		
	}
}