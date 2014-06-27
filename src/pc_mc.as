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
			super(Position, ParentClip, "PC", orignal);
			talkPosition = new Point(width / 2, 10);
			pc.text = " This is the intro of atpw enjoy whatever this is suposed to be. press this a lot for the ayeaye thing\n " + clickCount;
		}
		
		override protected function setDialog() {
				
				var P:Player = parentClip.player_mc.clone() //player clone
				var T:Character = this.clone(); //This clone
				var Extra:MovieClip = new AyeAye();
				
				dialog = [		new Dialog(T, "Article1: \n blabjkqfmdjqsmldfj"),
								new Dialog(P, "I think this broke"),
								new Dialog(T, "YOU SHALL SOON BE PURPLE!!"),
								new Dialog(P, "... I should probably leave now")];
				
				bonusDialog = [	new Dialog(Extra, "Yes the bonus is in already"),
								new Dialog(Extra, "FEAR ME\nYes I'm actualy serious, be afraid"),
								new Dialog(Extra, "fine don't be afraid"),
								new Dialog(Extra, "(ye im that obnoxious)")
								];	
	
		}
		
		var clickCount:int = 10;
		
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
				clickCount = 10;
				startDialog(new Conversation(parentClip, bonusDialog));
				}
				pc.text = " This is the intro of atpw enjoy whatever this is suposed to be. press this a lot for the ayeaye thing\n " + clickCount;
				
				
			}
		}
	}

}
