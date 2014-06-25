package
{
	
	import flash.display.MovieClip;
	
	public class player extends MovieClip
	{
		
		public function player()
		{
			// constructor code
		}
		
		public function MoveTo(xPos:int, yPos:int, speed:int):void
		{
			var testx=x;
			var testy=y;
			if (x != xPos)
			{
				if (x < xPos)
				{
					if (x + speed >= xPos)
					{
						x = xPos;
					}
					else
					{
						x += speed;
					}
				}
				else
				{
					if (x - speed <= xPos)
					{
						x = xPos;
					}
					else
					{
						x -= speed;
					}
				}
			}
			
			if (y != yPos)
			{
				
				if (y < yPos)
				{
					if (y + speed >= yPos)
					{
						y = yPos;
					}
					else
					{
						y += speed;
					}
				}
				else
				{
					if (y - speed <= yPos)
					{
						y = yPos;
					}
					else
					{
						y -= speed;
					}
				}
			}
		}
	
	}

}
