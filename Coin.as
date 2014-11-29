package{
	import flash.display.Sprite;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.DisplayObject;
	import flash.events.*;
	//sprites are just movieclips without any frames in them
	public class Coin extends Sprite{
		//_root will signify the root of the document
		private var _root:Object;
		
		public function Coin(){
			//this code will only be run once
			addEventListener(Event.ADDED, beginClass);
			//this code will constantly be run
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function beginClass(event:Event):void{
			//defining the root of the document
			_root = MovieClip(root);
			this.parent.addChild(this);
			
			//making an invisible box that will help in placement
			this.graphics.beginFill(0x000000,0);
			this.graphics.drawRect(0,0,25,25);
			//then adding a shape within it that will show the coin
			this.graphics.beginFill(0xDBDE05,1);
			this.graphics.drawCircle(12.5,12.5,4);
		}
		private function eFrame(event:Event):void{
			//hit testing with the coin and the main guy
			//we'll use math for this!
			if(_root.player.x <= this.x + _root.lvlHolder.x + 10
			   && _root.player.x >= this.x + _root.lvlHolder.x - 10
			   && _root.player.y <= this.y + 10
			   && _root.player.y >= this.y - 10){
				removeEventListener(Event.ENTER_FRAME, eFrame);
				this.parent.removeChild(this);
				//then we update the score!
				_root.mainScore += 10;
				if (!_root.mute)
				{
				_root.playSound4();
				}
			}
		}
	}
}