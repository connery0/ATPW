package
{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	public class Pc_mc extends Character
	{
		var bonusDialog:Array;
		public function Pc_mc(Position:Point, ParentClip:Main, orignal:Boolean = true)
		{
			super(Position, ParentClip, "Computer", orignal);
			talkPosition = new Point(width / 2, 10);
			pc.text = " This is the intro of atpw enjoy whatever this is suposed to be. press this a lot for the ayeaye thing\n " + clickCount;
		}
		
		override protected function setDialog() {
				
				var P:Player = parentClip.player_mc.clone() //player clone
				var T:Character = this.clone(); //This clone
				var Extra:MovieClip = new AyeAye();
				
				dialog = [		new Dialog(T, "---[1] Article available for viewing: [Newspaper: The Philosopher] [Author: Elin DeCarti] [Uploaded: Yor 34, SR / Hura67 / Minu21 / Secu95] “Nihilism continues to gorge on YiYa Model”---"),
								new Dialog(T, "The Nihilism has continued its relentless consumption of All. It was revealed to The Philosopher last night that Nihilism has invaded and infected the southernmost realities in the Ya Side. The Edge Of The Multiverse Port has been taken over, with only 1849 surviving Pantemplars falling back to the forest galaxies in Reality 3050329506.66."),
								new Dialog(T," “There is nothing we have to stop them.” Captain Legion says. “Our finest weapons do nothing. Looking on the Hive is like looking upon the maw of every monster that does not deserve to be...but is. And turning your comrades into bags of tentacles.”" ),
								new Dialog(T, "President Secular Thought of the RPS (Republic of the Paradox Seas) has been adamant that Crania will not succumb to The Purple, however, proving yet again his superior intuition than the Gods’ petty pseudo-democracy. “My finest Thoughts are working on defence mechanisms at this moment,” he said in a recent press release. “This city will never fall as long as I am in power.”")
								];
				
				bonusDialog = [	new Dialog(Extra, "Wait, what?! What am I doing in here?!"),
								new Dialog(P, "..."),
								new Dialog(Extra, "Damnit, my wife teleported me into The Code, again. Ugh, omnidimensional unicorns, am I right?!"),
								new Dialog(P, "...")
								];	
	
		}
		
		var clickCount:int = 5;
		
		override public function talkTo(e:Event)
		{
			if (talkChild != null)
			{
				if (parentClip.closestTalker == this) {
					parentClip.closestTalker = null;
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed);}
				
				
				if(clickCount>0){
				clickCount--;
				startDialog(new Conversation(parentClip, dialog));
				}
				else {
				clickCount = 5;
				startDialog(new Conversation(parentClip, bonusDialog));
				}
				pc.text = " This is the intro of atpw enjoy whatever this is suposed to be. press this a lot for the ayeaye thing\n " + clickCount;
				
				
			}
		}
	}

}
