package 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	
	public class SoundCtrl extends EventDispatcher
	{
		public static const PLAY_SOUND_EVENT:String = "play_sound_event";
		public static const STOP_SOUND_EVENT:String = "stop_sound_event";
		
		private var _sound:Sound;
		private var _soundChannel:SoundChannel;
		private var _isCyclePlay:Boolean;
		
		public function SoundCtrl( sound:Sound, isCyclePlay:Boolean )
		{
			_sound = sound;
			_isCyclePlay = isCyclePlay;
		}
		
		public function destroy():void
		{
			if( _soundChannel )
			{
				_soundChannel.stop();
				_soundChannel = null;
			}
		}
		
		public function initialize():void
		{
			if( _soundChannel )
			{
				_soundChannel.stop();
			}
		}
		
		private function error( e:IOErrorEvent ):void
		{
			trace( "error!" );
		}
		
		public function playSound( e:Event = null ):void
		{
			if( _soundChannel )
			{
				_soundChannel.stop();
			}
			_soundChannel = _sound.play();
		}
		
		public function stopSound( e:Event = null ):void
		{
			if( _soundChannel )
			{
				_soundChannel.stop();
				this.dispatchEvent( new Event( SoundCtrl.STOP_SOUND_EVENT ) );
			}
			if(e  && e.type == Event.SOUND_COMPLETE && _isCyclePlay )
			{
				playSound();
			}
		}
	}
}