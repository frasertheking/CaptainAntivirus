﻿package{	import flash.display.Sprite;	import flash.display.MovieClip;	import flash.display.Shape;	import flash.display.DisplayObject;	import flash.events.*;		//sprites are just movieclips without any frames in them	public class myBoard extends Sprite	{		//_root will signify the root of the document		private var _root:Object;		//how quickly the board can move		private var speed:Number;		//-1 is left, 1 is right		private var direction:int;				public function myBoard()		{			//this code will only be run once			addEventListener(Event.ADDED, beginClass);			//this code will constantly be run			addEventListener(Event.ENTER_FRAME, eFrame);		}				private function beginClass(event:Event):void		{			//defining the root of the document			_root = MovieClip(root);			//defining the movement variables of the board			speed = 3;			direction = 1;			this.x = 0;			//drawing the board (it'll look like a board xD)			this.graphics.beginFill(0x000000,1);			this.graphics.lineStyle(0,0x6E6E6E);			this.graphics.drawRect(0,0,25,25);		}				private function eFrame(event:Event):void		{			//TOUCHING THE MAIN CHARACTER			if(this.hitTestObject(_root.player))			{				if (_root.player.y <= this.y && !_root.mainBumping)				{					_root.player.x += speed * direction;					_root.onBoard = true;					_root.mainMove = 275 - _root.player.x;					_root.player.x += _root.mainMove;					_root.lvlHolder.x += _root.mainMove;					_root.bgHolder.x = 0;				}			}						if (_root.lvlCurrent == 8)			{				speed = 4;			}						//MOVING THE BOARD			this.x += speed * direction;			//checking if touching any invisible markers			for(var i:int=0;i<_root.invisMarkerHolder.numChildren;i++)			{				//the process is very similar to the main guy's testing with other elements				var targetMarker:DisplayObject = _root.invisMarkerHolder.getChildAt(i);				if(hitTestObject(targetMarker))				{					direction *= -1;					this.x += speed * direction;				}			}		}	}}