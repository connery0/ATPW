package
{
	
	import flash.display.MovieClip;
	
	public class player extends MovieClip
	{
		
		public function player(Frame:int)
		{
			gotoAndStop(Frame);
			// constructor code
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
			
			if ((xspeed > 0 && x + xspeed >= xPos) || ( xspeed < 0 && x + xspeed <= xPos)) {
			x = xPos;	
			}else{x += xspeed;}
			if ((yspeed > 0 && y + yspeed >= yPos) || ( yspeed < 0 && y + yspeed <= yPos)) {
			y = yPos;	
			}else{y += yspeed;}
			
		}
	
	}

}
