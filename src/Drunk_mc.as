package
{
	
	import flash.geom.Point;
	
	public class Drunk_mc extends Character
	{
		
		public function Drunk_mc(Position:Point, parentClip:Main, orignal:Boolean = true)
		{
			super(Position, parentClip, "Drunk Thought", orignal);
		
		}
		
		override protected function setDialog()
		{
			var P:Player = parentClip.player_mc.clone() //player clone
			var T:Character = this.clone(); //This clone
			
			dialog = [	new Dialog(T, "HEY! Yeah you~...\n Leetz me tell you zomethiiing *hic*..."),
						new Dialog(P, "(How much did this guy drink)"),
						new Dialog(T, "Noooone of this *hic* is real *hic*\n Hahahah*hic*Hahahahah It's all a game *hic*"),
						new Dialog(P, "(note to self: do NOT drink whatever he drank)")
						];
		}
	}

}
