package
{
	
	import flash.geom.Point;
	
	public class Greedy_mc extends Character
	{
		
		public function Greedy_mc(Position:Point, parentClip:Main, orignal:Boolean = true)
		{
			super(Position, parentClip, "Greedy Thought", orignal);
		
		}
		
		override protected function setDialog()
		{
			var P:Player = parentClip.player_mc.clone() //player clone
			var T:Character = this.clone(); //This clone
			
			dialog = [	new Dialog(T, "Oi, oi! You! Yeah, y- *hic* you!"),
						new Dialog(P, "Err, yes?"),
						new Dialog(T, "Get me another, will ya? \nAnother cup of Stromabeer, yeah?"),
						new Dialog(P, "Sorry, I only have enough Zeus for myself."),						
						new Dialog(T, "Awww, okay, it-it *hic* just I need to drown my sorrows away, y’see? I left my friend behind, right? Lucky Thought, straight for the Nihilism. I shouldn’t have done it, I know I know I know, but if I didn’t I’d never get to *hic* be here, y’see? "),						
						new Dialog(P, "Uh, right."),						
						new Dialog(T, "Damn, should have gone with that strange lanky line and his bendy friend... what was he called, Enil? Think so, yeah. Y’see, I used to work in this *hic* casino, right in the Hive, had Nihithulu herself come and *hic* play a few rounds of Kapish. But then they came and made her angry, hoped to kill her off and stop Nihilism. Guess they failed, cos I dunno if you’ve read the news article yet but that purple stuff *hic* is EVERYWHERE"),						
						new Dialog(T, "Hopefully it gets me too, so I don’t  have to think about me being this...mess anymore. Oh, Lucky, poor poor Lucky, I’m so stupid Lucky.."),						
						new Dialog(P, "..I’m sorry for your loss."),
						new Dialog(new Marker(new Point(0,0)),"He does not hear you behind the sobbing.")
						];
		}
	}

}
