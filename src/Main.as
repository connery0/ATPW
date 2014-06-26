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
			player_mc.x = 330;
			player_mc.y = 225;
			T = Object(root).Text_txt;
			
			stage.addEventListener(Event.ENTER_FRAME, UpdateCursor);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
			
			
			
			for (var i = 0; i < obstArray.length; i++)
			{
				addChild(obstArray[i]);
			}
			
			playerpointery = player_mc.y;
			playerpointerx = player_mc.x;
			
			addChild(player_mc);
			
			DoMath(Math.PI / 3);
		
		}
		
		public function DoMath(angle:Number)
		{
			
			trace("A= " + angle);
			trace("Cos= " + int(Math.cos(angle) * 100) / 100);
			trace("Sin= " + int(Math.sin(angle) * 100) / 100);
		
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
		
		var obstArray:Array = [new Table_mc(new Point(100, 288)), new Table_mc(new Point(508, 75)), new Table_mc(new Point(562, 294)), new Pc_mc(new Point(78, 109)), new Bar_mc(new Point(327, 360)), new BorderH(new Point(380, -44)), new BorderH(new Point(380, 510)), new BorderV(new Point(-39, 250)), new BorderV(new Point(840, 250))]
		
		
		
		
		
		private function keyDown(e:KeyboardEvent) {
		
			switch(e.keyCode) {
				case 37: 
				playerpointerx = player_mc.x-200;
				break;
				
				case 38: 
				playerpointery = player_mc.y-200;
				break;
				
				case 39: 
				playerpointerx = player_mc.x+200;
				break;
				
				case 40: 
				playerpointery = player_mc.y+200;
				break;
				
				}	
			
			}
		
		private function keyUp(e:KeyboardEvent) {
			
			switch(e.keyCode) {
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
		
		private function UpdateCursor(e:Event)
		{
			if (mDown)
			{
				playerpointery = stage.mouseY;
				playerpointerx = stage.mouseX;
			}
			
			MousePoint.x = stage.mouseX;
			MousePoint.y = stage.mouseY;
			T.text = "X= " + MousePoint.x + " Y= " + MousePoint.y;
			
			player_mc.MoveTo(playerpointerx, playerpointery, 20);
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		}
		
		public function getObjects():Array
		{
			return obstArray;
		}
		
		
		public function MovePoint(toMove:Array, moveTo:Array, distance:int):Array
		{
			var Angle:Number = Math.atan((moveTo[1] - toMove[1]) / (moveTo[0] - toMove[0]));
			
			trace(Angle + "dist: " + distance + "            cos: " + Math.cos(Angle));
			toMove[0] += distance * Math.cos(Angle);
			toMove[1] += distance * Math.sin(Angle);
			return toMove;
		
		}
	
	}

}