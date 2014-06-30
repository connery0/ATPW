package
{
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	public class Bartering_mc extends Character
	{
		
		public function Bartering_mc(Position:Point, parentClip:Main, orignal:Boolean = true)
		{
			super(Position, parentClip, "Sobre Thought", orignal);
		
		}
		
		override public function talkTo(e:Event) {
			if (talkChild != null)
			{	
				if (parentClip.closestTalker == this) {
					parentClip.closestTalker = null;
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed); }
				if(!parentClip.pickedAFight){	
					startDialog(new Conversation2(parentClip, dialog));
				parentClip.pickedAFight = true; }
			else {
					startDialog(new Conversation3(parentClip));
				
				}	
			}
		}
		
		
		
		
		override protected function setDialog()
		{
			var P:Player = parentClip.player_mc.clone() //player clone
			var T:Character = new Polytheist_mc(new Point(0, 0), parentClip, false);
			var Bar:Character = this.clone();			
			
			dialog = [	new Dialog(Bar, "How can I help you?"),
						new Dialog(P, "One Stromabeer, please."),
						new Dialog(Bar, "Sure thing."),						
						new Dialog(T, "So, where are you headed?"),
						new Dialog(P, " Crania. I have an old friend I need to see."),
						new Dialog(T, "Ahh, cool. Wouldn’t want to be out tonight, especially in this weather."),
						new Dialog(P, "Yeah, the journey here was brutal. I managed to lose most- I mean, some- of my best Combat-Cards in the waves."),
						new Dialog(T, "Heh, Combat-Cards. Never thought that would take off, but three Yors later and here we are. Still a Battle Dimension person myself, but that’s impossible now, obviously."),
						new Dialog(P, "Nihilism really gets its roots into everything, huh?"),
						new Dialog(T, "Sure does. With Secular Thought as president, though, I’m sure the RPS can adapt."),
						new Dialog(Bar, "Amen to that!"),
						new Dialog(P, "...Right."),
						new Dialog(T, "You can’t deny he’s the best leader. Glad he performed that coup on that mess Udynea. God of Monotheism?! Pah! Terrible leader."),
						new Dialog(P, "..."),
						new Dialog(T, "What a mess, we’d have had the Pantheon come and walk on all of us, subjugate us in no time. Secular knew what to do to save us all, built that temporal construct, bless him."),
						new Dialog(P, "I... heard... that Udynea was going to do that anyway. And then was exiled by Secular, before he could act on it."),
						new Dialog(T, "Oh yeah? Well, your sources are wrong."),
						new Dialog(P, "..."),
						new Dialog(T, "Tell you what though, I hope that Nihilism eats the hell out of the Pantheon, haha. Get rid of those blighters and we can live in peace forever."),
						new Dialog(P, "I concur. On that point, at least."),
						new Dialog(T, "Well, on all the points, you mean. The only ones who say otherwise are, like, those progressive-hippie thoughts, the ones all up in their gang wars in the Artist’s Quarter."),
						new Dialog(P, "..."),
						new Dialog(T, "That, or... terrorists."),
						new Dialog(P, "Freedom fighters. They’re freedom fighters."),						
						new Dialog(Bar,"How... How dare you."),
						new Dialog(P, "What?"),
						new Dialog(T, "Are you one of them?! Are you a terrorist?! That sounds like terrorist talk!"),
						new Dialog(Bar,"Get out of my bar."),
						new Dialog(P, "What do you mean?! I’m-I’m- not a terrorist, the real terrorists are N.E.U.R.O.N Corps! How can you be so blind?!"),
						new Dialog(Bar,"I said, GET OUT!")
						];
		}
	}

}
