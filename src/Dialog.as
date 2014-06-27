
package
{
	import flash.display.MovieClip;
	
	public class Dialog
	{
		var portrait:MovieClip;
		var text:String;
		var naam:String;
		public function Dialog(char:MovieClip, text:String)
		{
			this.text = text;
			portrait = char;
			naam = portrait.characterName;
			if (portrait.height > 70 || portrait.width > 70)
			{
				if (portrait.width > portrait.height)
				{
					
					portrait.scaleX = 70 / portrait.width;
					portrait.scaleY = portrait.scaleX;
					
				}
				else
				{
					portrait.scaleY = 70 / portrait.height;
					portrait.scaleX = portrait.scaleY;
				}
				
			}
		}
	
	}

}
