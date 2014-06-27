package
{
	
	import flash.geom.Point;
	
	public class Greedy_mc extends Character
	{
		
		public function Greedy_mc(Position:Point, parentClip:Main, orignal:Boolean = true)
		{
			super(Position, parentClip, "Greedy thought", orignal);
		
		}
		
		override protected function setDialog()
		{
			var P:Player = parentClip.player_mc.clone() //player clone
			var T:Character = this.clone(); //This clone
			
			dialog = [	new Dialog(P, "Hello"),
						new Dialog(T, "MINE!!!"),
						new Dialog(P, "... what? I just said hello?"),
						new Dialog(T, "I don't care EVERYTHING is MINE!!")
						];
		}
	}

}
