﻿package{	import flash.display.Sprite;	import flash.display.MovieClip;	import flash.display.Shape;	import flash.display.DisplayObject;	import flash.events.*;	//sprites are just movieclips without any frames in them	public class jail extends Sprite{		//_root will signify the root of the document		private var _root:Object;				public function jail(){			//this code will only be run once			addEventListener(Event.ADDED, beginClass);			//this code will constantly be run			addEventListener(Event.ENTER_FRAME, eFrame);		}				private function beginClass(event:Event):void{			//defining the root of the document			_root = MovieClip(root);			// drawing the jail cell			this.graphics.beginFill(0x858581,1);			this.graphics.drawRect(0,0,25,25);		}		private function eFrame(event:Event):void{						// check to see if the main guy has a key			if (_root.hasKey == true)				{					// if he does, remove the jail cell					removeEventListener(Event.ENTER_FRAME, eFrame);					this.parent.removeChild(this);				}		}	}}