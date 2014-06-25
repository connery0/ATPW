package
{
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	public class Object_mc extends MovieClip
	{
		
		public function Object_mc(Position:Point)
		{
			// constructor code
			stop()
			x = Position.x;
			y = Position.y;
		}
		
		public function Collide(check:Point):Boolean
		{
			
			// assuming (0, 0) is top left
			var topLeftStage:Point = this.localToGlobal(new Point(-width / 2, -height / 2));
			
			// bottom right
			var bottomRightStage:Point = this.localToGlobal(new Point(width / 2, height / 2));
			
//			trace("1= " + (topLeftStage.x <= check.x));
//			trace("2= " + (topLeftStage.y <= check.y));
//			trace("3= " + (bottomRightStage.x > check.x));
//			trace("4= " + (bottomRightStage.y > check.y));
			
			if (topLeftStage.x <= check.x && topLeftStage.y <= check.y && bottomRightStage.x > check.x && bottomRightStage.y > check.y)
			{
				gotoAndStop(2);
				return true;
				
			}
			else
			{
				gotoAndStop(1);
				return false;
			}
		
		}
	
	}

}
