package
{
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class player extends MovieClip
	{
		var Parent:Main;
		public function player(Parent:Main)
		{
			this.Parent = Parent;
			// constructor code
		trace([this.localToGlobal(new Point(width / 2 + 0, 0)), this.localToGlobal(new Point(width / 2 + 0, height / 2)), this.localToGlobal(new Point(width / 2 + 0, height ))]);
			}
		
		public function MoveTo(xPos:int, yPos:int, speed:int):void
		{
						
			var beta:Number = Math.atan((yPos - y) / (xPos - x));
			var xspeed:Number=speed*int(Math.cos(beta)*100)/100;
			var yspeed:Number=speed*int(Math.sin(beta)*100)/100;
			if (xspeed < 0) { xspeed = -xspeed; }
			if (yspeed < 0) { yspeed = -yspeed; }
			if (x > xPos) { xspeed = -xspeed; }
			if (y > yPos) { yspeed = -yspeed; }
						
			////////////////////////////////////////////////////////////////////////////////////
			var top:Point = this.localToGlobal(new Point(xspeed, height + yspeed ));
			var bottom:Point = this.localToGlobal(new Point(xspeed,yspeed));
			var bottomRight:Point = this.localToGlobal(new Point((width/2)+xspeed,(0)+yspeed));
			var bottomLeft:Point = this.localToGlobal(new Point((-width/2)+xspeed,(0)+yspeed));
			var middleRight:Point = this.localToGlobal(new Point((width/2)+xspeed,(height/2)+yspeed));
			var middleLeft:Point = this.localToGlobal(new Point((-width/2)+xspeed,(height/2)+yspeed));
			////////////////////////////////////////////////////////////////////////////////////
			
		//	if ((xspeed > 0 && x + xspeed >= xPos ) || ( xspeed < 0 && x + xspeed <= xPos)) {
		//	x = xPos;	
		//	}else{x += xspeed;}
		//	if ((yspeed > 0 && y + yspeed >= yPos) || ( yspeed < 0 && y + yspeed <= yPos)) {
		//	y = yPos;	
		//	}else{y += yspeed;}

		if (xspeed > 0 && !CheckPoints([this.localToGlobal(new Point(width / 2 + xspeed, 0)), this.localToGlobal(new Point(width / 2 + xspeed, height / 2)), this.localToGlobal(new Point(width / 2 + xspeed, height ))])) {
		
			x += xspeed;
			
			}	
		
		
		
		
		
		
		}
		
		
		private function CheckPoints(Points:Array):Boolean {
			var collision:Boolean
			
			for (var i:int = 0; i <Parent.getObjects().length; i++) 
			{
				var A:Object_mc = Parent.getObjects()[i];
					
					for (var j:int = 0; j < Points.length; j++) {
						
						if (A.Collide(Points[j])) { 
							collision = true;
							A.gotoAndStop(2);
							i = Parent.getObjects().length;
							j = Points.length;
						}						
					}			
				}
			
			return collision;
		}
	
	}

}
