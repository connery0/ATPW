	package
{
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Player extends MovieClip
	{
		var Parent:Main;
		
		public function Player(Parent:Main)
		{
			this.Parent = Parent;
			// constructor code
			trace([this.localToGlobal(new Point(width / 2 + 0, 0)), this.localToGlobal(new Point(width / 2 + 0, height / 2)), this.localToGlobal(new Point(width / 2 + 0, height))]);
		}
		
		public function MoveTo(xPos:int, yPos:int, speed:int):void
		{
			
			var beta:Number = Math.atan((yPos - y) / (xPos - x));
			var xspeed:Number = speed * int(Math.cos(beta) * 100) / 100;
			var yspeed:Number = speed * int(Math.sin(beta) * 100) / 100;
			if (xspeed < 0)
			{
				xspeed = -xspeed;
			}
			if (yspeed < 0)
			{
				yspeed = -yspeed;
			}
			if (x > xPos)
			{
				xspeed = -xspeed;
			}
			if (y > yPos)
			{
				yspeed = -yspeed;
			}
			
	
			
			if (xspeed > 0 && !CheckPoints([new Point(x + (width / 2) + xspeed, y), new Point(x + (width / 2) + xspeed, y - (height / 2)), new Point(x + (width / 2) + xspeed, y - height)]))
			{
				if (x + xspeed > xPos)
				{
					x = xPos
				}
				else
				{
					x += xspeed;
				}
			}
		
			
				if (xspeed < 0 && !CheckPoints([new Point(x - (width / 2) + xspeed, y), new Point(x - (width / 2) + xspeed, y - (height / 2)), new Point(x - (width / 2) + xspeed, y - height)]))
			{
				if (x + xspeed < xPos)
				{
					x = xPos
				}
				else
				{
					x += xspeed;
				}
			}
			
			if (yspeed > 0 && !CheckPoints([new Point(x,y+yspeed), new Point(x - (width / 2), y+yspeed), new Point(x + (width / 2), y+yspeed )]))
			{
				if (y + yspeed > yPos)
				{
					y = yPos
				}
				else
				{
					y += yspeed;
				}
			}
			
			if (yspeed <0 && !CheckPoints([new Point(x,y-height+yspeed), new Point(x - (width / 2), y-height+yspeed), new Point(x + (width / 2), y-height+yspeed )]))
			{
				if (y + yspeed < yPos)
				{
					y = yPos
				}
				else
				{
					y += yspeed;
				}
			}
			
		
		}
		
		private function CheckPoints(Points:Array):Boolean
		{
			var collision:Boolean
			
			for (var i:int = 0; i < Parent.getObjects().length; i++)
			{
				var A:Object_mc = Parent.getObjects()[i];
				
				for (var j:int = 0; j < Points.length; j++)
				{
					
					if (A.Collide(Points[j]))
					{
						collision = true;
						i = Parent.getObjects().length;
						j = Points.length;
					
					}
				}
			}
			
			return collision;
		}
	
	}

}
