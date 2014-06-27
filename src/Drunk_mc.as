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
			
			dialog = [	new Dialog(T, "Y’see, y’see, there’s this... *hic* like, weird painting in that computer over there, right? *hic* Yeah? Got a thing for *hic* unicorns or something."),
						new Dialog(P, "Uh."),
						new Dialog(T, "And he’s *hic* proof! Proof, I tell ya, that this is all a *hic* a simulation! A game! I bet there’s a bunch of... *hic* of internet people making commands for what happens next, I *hic* tell ya!"),
						new Dialog(P, "Hmm."),
						new Dialog(T, "THE CODE IS EVIL! DEFEAT THE GLITCHSTERS!"),
						new Dialog(P, "You’ve had too much to drink, I think."),
						new Dialog(T, "Zzzzzzzz... zzzzzz..."),
						new Dialog(P, "Hmm.")
						];
		}
	}

}
