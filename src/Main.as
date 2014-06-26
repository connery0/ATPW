package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Connesry0
	 */
	[Frame(factoryClass="Preloader")]
	
	public class Main extends Sprite
	{
		var MousePoint:Point = new Point(0, 0);
		var T:TextField;
		var point1:Array = [0, 0];
		var player_mc:Player;
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			///////////////////////////////////////////////////////////////
			// entry point                                               //
			///////////////////////////////////////////////////////////////
			
			player_mc = new Player(this);
			charArray= [new Pc_mc(new Point(78, 109),this), new Bartering_mc(new Point(323, 351),this)];
			
			
			player_mc.x = 330;
			player_mc.y = 225;
			
			AddListeners();
			
			for (var i = 0; i < (obstArray.concat(charArray)).length; i++)
			{
				addChild((obstArray.concat(charArray))[i]);
			}
			
			playerpointery = player_mc.y;
			playerpointerx = player_mc.x;
			
			addChild(player_mc);
			
			CreateTalkRange(32, 60);		
		}
		var centerP:Marker;
		var talkrange:Array;
		
		public function AddListeners()
		{
			stage.addEventListener(Event.ENTER_FRAME, UpdateGame);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			for (var i = 0; i < charArray.length; i++)
			{
				Character(charArray[i]).addEventListener(MouseEvent.CLICK, Character(charArray[i]).talkTo);
			}
		
		}
		
		public function RemoveListeners()
		{
			stage.removeEventListener(Event.ENTER_FRAME, UpdateGame);
			stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			for (var i = 0; i < charArray.length; i++)
			{
				Character(charArray[i]).removeEventListener(MouseEvent.CLICK, Character(charArray[i]).talkTo);
			}
		
		}
		
		private function CreateTalkRange(dots:int, range:int)
		{
			talkrange = [];
			var centerPoint:Point = new Point(player_mc.x, player_mc.y - (player_mc.height / 2));
			
			centerP = new Marker(centerPoint);
			addChild(centerP);
			
			for (var i = 0; i < dots; i++)
			{
				var Angle = (2 * Math.PI / dots) * i;
				talkrange = talkrange.concat(new Marker(new Point(range * Math.cos(Angle), range * Math.sin(Angle))))
				centerP.addChild(talkrange[talkrange.length - 1]);
				
			}
		
		}
		
		var playerpointerx = 0;
		var playerpointery = 0;
		var mDown = false;
		
		private function mouseDown(e:Event)
		{
			mDown = true;
		
		}
		
		private function mouseUp(e:Event)
		{
			mDown = false;
		
		}
		
		private function Clicked(e:Event)
		{
			playerpointery = stage.mouseY;
			playerpointerx = stage.mouseX;
		}
		
		//////////////////////////////////////////////////////////////////////
		var obstArray:Array = [new Table_mc(new Point(100, 288)), new Table_mc(new Point(508, 75)), new Table_mc(new Point(562, 294)), new Bar_mc(new Point(327, 360)), new BorderH(new Point(380, -44)), new BorderH(new Point(380, 510)), new BorderV(new Point(-39, 250)), new BorderV(new Point(840, 250))]
		var charArray:Array;
		
		//////////////////////////////////////////////////////////////////////
		
		private function keyDown(e:KeyboardEvent)
		{
			
			switch (e.keyCode)
			{
				case 37: 
					playerpointerx = player_mc.x - 2000;
					break;
				
				case 38: 
					playerpointery = player_mc.y - 2000;
					break;
				
				case 39: 
					playerpointerx = player_mc.x + 2000;
					break;
				
				case 40: 
					playerpointery = player_mc.y + 2000;
					break;
			
			}
		
		}
		
		private function keyUp(e:KeyboardEvent)
		{
			
			switch (e.keyCode)
			{
				case 37: 
					playerpointerx = player_mc.x;
					break;
				
				case 38: 
					playerpointery = player_mc.y;
					break;
				
				case 39: 
					playerpointerx = player_mc.x;
					break;
				
				case 40: 
					playerpointery = player_mc.y;
					break;
			
			}
		}
		var Q:Boolean = true;
		
		private function UpdateGame(e:Event)
		{
			if (mDown)
			{
				playerpointery = stage.mouseY;
				playerpointerx = stage.mouseX;
			}
			
			MousePoint.x = stage.mouseX;
			MousePoint.y = stage.mouseY;
	
			
			player_mc.MoveTo(playerpointerx, playerpointery, 20);
			
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			centerP.x = player_mc.x;
			centerP.y = player_mc.y - player_mc.height / 2;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			for (var i = 0; i < charArray.length; i++)
			{
				var Q:Boolean = false;
				
				for (var j = 0; j < talkrange.length; j++)
				{
					if (charArray[i].Collide(talkrange[j].getPoint()))
					{
						talkrange[j].gotoAndPlay(2);
						Q = true;
					}
				}
				charArray[i].talkingRange(Q);
				
			}
		}
		
		public function getObjects():Array
		{
			return obstArray.concat(charArray);
		}
		
		public function MovePoint(toMove:Array, moveTo:Array, distance:int):Array
		{
			var Angle:Number = Math.atan((moveTo[1] - toMove[1]) / (moveTo[0] - toMove[0]));
			
			toMove[0] += distance * Math.cos(Angle);
			toMove[1] += distance * Math.sin(Angle);
			return toMove;
		
		}
	
	}

}