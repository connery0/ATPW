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
		var MousePoint:Point=new Point(0,0);
		var T:TextField;
		var point1:Array = [0, 0];
		var Player:player = new player();
		
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
		
			T = Object(root).Text_txt;
			
			this.addEventListener(Event.ENTER_FRAME, UpdateCursor);
			this.addEventListener(MouseEvent.CLICK, Clicked);
		
			for (var i = 0; i < obstArray.length; i++ ) {
			addChild(obstArray[i]);	
			}
			
			
			addChild(Player);
		
		}
		
		private function Clicked(e:Event)
		{
		}
		
		var obstArray:Array=[new Object_mc(new Point(50, 100)),new Object_mc(new Point(100, 100)),new Object_mc(new Point(120, 300))]
		
		private function UpdateCursor(e:Event)
		{
			Player.MoveTo(MousePoint.x, MousePoint.y); 
			MousePoint.x = stage.mouseX;
			MousePoint.y = stage.mouseY;
			T.text = "X= " + MousePoint.x + " Y= " + MousePoint.y;
		
			for (var i = 0; i < obstArray.length; i++ ) {
			obstArray[i].Collide(MousePoint);
			}
		}
		
		public function TrackRoute(position:Point):void
		{
			var tempPoint = point1;
			var safety = 0;
			while (Distance(tempPoint, [position.x, position.y]) > 5 && safety < 100)
			{
				trace("temppoint= " + int(tempPoint[0]) + "," + int(tempPoint[1]) + "   point2= " + int(position.x) + "," + int(position.y));
				addChild(new Marker(tempPoint[0], tempPoint[1]));
				MovePoint(tempPoint, [position.x, position.y], 15);
				safety += 1;
			}
		
		}
		
		public function Distance(Point1:Array, point2:Array):Number
		{
			return Math.sqrt(Math.pow((Point1[0] - point2[0]), 2) + Math.pow((Point1[1] - point2[1]), 2));
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