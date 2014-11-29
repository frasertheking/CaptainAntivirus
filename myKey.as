package{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import flash.events.*;
	//sprites are just movieclips without any frames in them
	public class myKey extends Sprite{
		//_root will signify the root of the document
		private var _root:Object;
		
		public function myKey(){
			//this code will only be run once
			addEventListener(Event.ADDED, beginClass);
			//this code will constantly be run
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function beginClass(event:Event):void{
			//defining the root of the document
			_root = MovieClip(root);
			// drawing the key
			this.graphics.beginFill(0x000000,0);
			this.graphics.drawRect(0,0,25,25);	
			this.graphics.beginFill(0x0BD0CA,1);
			this.graphics.drawCircle(12.5,12.5,4);
		}
		private function eFrame(event:Event):void{
			//hit testing with the key and the main guy
			//we'll use math for this!
			if(_root.player.x <= this.x + _root.lvlHolder.x + 10
			   && _root.player.x >= this.x + _root.lvlHolder.x - 10
			   && _root.player.y <= this.y + 10
			   && _root.player.y >= this.y - 10){
				this.removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
				//this.graphics.beginFill(0x000000,1);
				//this.graphics.beginFill(0x000000,1);
				_root.hasKey = true;
				_root.hint_txt.text = "You have unlocked the jail block!";
				if (!_root.mute)
				{
				_root.playSound4();
				}
			}
		}
	}
}