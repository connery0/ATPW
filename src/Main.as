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
		var player_mc:player = new player(1);
		var player_mc2:player = new player(2);
		
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
			
			stage.addEventListener(Event.ENTER_FRAME, UpdateCursor);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
		
			for (var i = 0; i < obstArray.length; i++ ) {
			addChild(obstArray[i]);	
			}
			
			player_mc.x = stage.mouseX;
			player_mc.y = stage.mouseY;
			player_mc2.x = stage.mouseX;
			player_mc2.y = stage.mouseY;
			playerpointery = stage.mouseY;
			playerpointerx = stage.mouseX;
			
			addChild(player_mc);
			addChild(player_mc2);
		
			
			DoMath(Math.PI/3);
			
		}
		
		public function DoMath(angle:Number) {
		
			trace("A= " + angle);
			trace("Cos= " +int( Math.cos(angle)*100)/100);
			trace("Sin= " +int(Math.sin(angle)*100)/100);
			
			
			
			}
		
		
		
		
			var playerpointerx =0;
			var playerpointery = 0;
			var mDown = false;
			
			private function mouseDown(e:Event) {
			mDown = true;
	
			}
			
			private function mouseUp (e:Event) {
			mDown = false;
	
			}
			
			
			
			
		private function Clicked(e:Event)
		{
			playerpointery = stage.mouseY;
			playerpointerx = stage.mouseX;
			
		}
		
		var obstArray:Array = [new Object_mc(new Point(50, 100)), new Object_mc(new Point(100, 100)), new Table_mc(new Point(100, 288)), new Table_mc(new Point(508, 75)), new Table_mc(new Point(562, 294)), new pc_mc(new Point(78, 109)), new bar_mc(new Point(327, 360)) ]
		
		
		
		private function UpdateCursor(e:Event)
		{
			if (mDown) {
			
			playerpointery = stage.mouseY;
			playerpointerx = stage.mouseX;	
			}

			
			MousePoint.x = stage.mouseX;
			MousePoint.y = stage.mouseY;
			T.text = "X= " + MousePoint.x + " Y= " + MousePoint.y;
		
			player_mc.MoveTo(MousePoint.x, MousePoint.y,20); 
			player_mc2.MoveTo(playerpointerx, playerpointery, 20);
			for (var i = 0; i < obstArray.length; i++ ) {
			CheckHits(obstArray[i])
			}
			
		}
		
		
		private function CheckHits(O:Object_mc) {
			
				if ((O.Collide(new Point((player_mc.x - player_mc.width / 2), player_mc.y))||O.Collide(new Point((player_mc.x - player_mc.width / 2), player_mc.y - player_mc.height/2))||O.Collide(new Point((player_mc.x), player_mc.y - player_mc.height))||O.Collide(new Point((player_mc.x), player_mc.y - player_mc.height/2))||O.Collide(new Point((player_mc.x), player_mc.y))||O.Collide(new Point((player_mc.x + player_mc.width / 2), player_mc.y))||O.Collide(new Point((player_mc.x + player_mc.width / 2), player_mc.y - player_mc.height/2)))||(O.Collide(new Point((player_mc2.x - player_mc2.width / 2), player_mc2.y))||O.Collide(new Point((player_mc2.x - player_mc2.width / 2), player_mc2.y - player_mc2.height/2))||O.Collide(new Point((player_mc2.x), player_mc2.y - player_mc2.height))||O.Collide(new Point((player_mc2.x), player_mc2.y - player_mc2.height/2))||O.Collide(new Point((player_mc2.x), player_mc2.y))||O.Collide(new Point((player_mc2.x + player_mc2.width / 2), player_mc2.y))||O.Collide(new Point((player_mc2.x + player_mc2.width / 2), player_mc2.y - player_mc2.height/2))))
				{
					O.gotoAndStop(2)
				}
				else {
				O.gotoAndStop(1);	
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