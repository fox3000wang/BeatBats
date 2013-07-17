package
{

	public class SoundCtrler
	{
		private var _sceneSoundCtrl:SoundCtrl;
		private var _successSoundCtrl:SoundCtrl;
		private var _loseSoundCtrl:SoundCtrl;
		private var _hurtSoundCtrl:SoundCtrl;
		private var _attackSoundCtrl:SoundCtrl;
		private var _hitSoundCtrl:SoundCtrl;
		
		
		public function SoundCtrler()
		{
			_sceneSoundCtrl      = new SoundCtrl(new EmbedResource.sceneMusicClass, true);
			_successSoundCtrl    = new SoundCtrl(new EmbedResource.successMusicClass,false);
			_loseSoundCtrl       = new SoundCtrl(new EmbedResource.loseMusicClass,false);
			_hurtSoundCtrl       = new SoundCtrl(new EmbedResource.hurtSoundClass,false);
			_attackSoundCtrl     = new SoundCtrl(new EmbedResource.attackSoundClass,false);
			_hitSoundCtrl        = new SoundCtrl(new EmbedResource.hitSoundClass,false);
		}
		
		public function get sceneSoundCtrl():SoundCtrl
		{
			return _sceneSoundCtrl;
		}
		
		public function get successSoundCtrl():SoundCtrl
		{
			return _successSoundCtrl;
		}
		
		public function get loseSoundCtrl():SoundCtrl
		{
			return _loseSoundCtrl;
		}
		
		public function get hurtSoundCtrl():SoundCtrl
		{
			return _hurtSoundCtrl;
		}
		
		public function get attackSoundCtrl():SoundCtrl
		{
			return _attackSoundCtrl;
		}
		
		public function get hitSoundCtrl():SoundCtrl
		{
			return _hitSoundCtrl;
		}
	}
}