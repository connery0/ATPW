package
{
	
	import flash.events.Event;
	import flash.geom.Point;
	
	public class Pc_mc extends Character
	{
		var bonusDialog:Array;
		public function Pc_mc(Position:Point, ParentClip:Main, orignal:Boolean = true)
		{
			super(Position, ParentClip, "PC", orignal);
			talkPosition = new Point(width / 2, 10);
			pc.text = " This is the intro of atpw enjoy whatever this is suposed to be. press this a lot for the ayeaye thing\n " + clickCount;
			
			if (orignal)
			{
				var P:Player = parentClip.player_mc.clone() //player clone
				var T:Character = this.clone(); //This clone
				var Extra:Character = new Bartering_mc(new Point(0,0),parentClip,false);
				dialog = [new Dialog(T, "Article1: \n blabjkqfmdjqsmldfj"), new Dialog(P, "I think this broke"), new Dialog(T, "YOU SHALL SOON BE PURPLE!!"), new Dialog(P, "... I think I should leave this thing")];
				bonusDialog = [new Dialog(Extra, "Yes the bonus is in already"),new Dialog(P, "no aye yet though"),new Dialog(P, "He will be added soon-ish"), new Dialog(T, "mabey")];	
			}
		}
		
		var clickCount:int = 10;
		
		override public function talkTo(e:Event)
		{
			if (talkChild != null)
			{
				if(clickCount>0){
				clickCount--;
				parentClip.addChild(new Conversation(parentClip, dialog));
				}
				else {
				clickCount = 10;
				parentClip.addChild(new Conversation(parentClip, bonusDialog));
				}
				pc.text = " This is the intro of atpw enjoy whatever this is suposed to be. press this a lot for the ayeaye thing\n " + clickCount;
				
				
			}
		}
	}

}
