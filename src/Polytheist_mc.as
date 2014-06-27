package
{
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	public class Polytheist_mc extends Character
	{
	
		var pickedAFight:Boolean = false
		var barDialog:Array;
		public function Polytheist_mc(Position:Point, parentClip:Main, orignal:Boolean = true)
		{
			super(Position, parentClip, "Polyetheist thought", orignal);
		
		}
		
		override protected function setDialog()
		{
			var P:Player = parentClip.player_mc.clone() //player clone
			var T:Character = this.clone(); //This clone
			
			dialog = [	new Dialog(T, "I have honestly no idea what I am suposed to be"),
						new Dialog(T, "WANT TO FIGHT MATE!!!!"),
						new Dialog(new Marker(new Point(0,0)), "(Talk to polyetheist thought again to start the fight)")
					];
			
			barDialog = [	new Dialog(T, "Soooooo... why are we drinking stuff?"),
							new Dialog(T, "We don't even have hands or mouths, what is this beer doing here?!"),
							new Dialog(P, "I have no clue, arn't we suposed to fight now?"),
							new Dialog(T, "I gues you're right,...")
					];
					
		}
		
		override public function talkTo(e:Event)
		{
			if (talkChild != null)
			{ 
				if (parentClip.closestTalker == this) {
					parentClip.closestTalker = null;
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed);}
				
				if(!pickedAFight){
				startDialog(new Conversation(parentClip, dialog));
				pickedAFight = true;
				}else{
				parentClip.gotoAndStop("pre fight talk");
				parentClip.layer1.addChild(new intermission());
				startDialog(new Conversation(parentClip, barDialog));
				parentClip.addEventListener(Event.ENTER_FRAME, parentClip.introOver);
				}
			}
		}
		
		
		
		
	}

}
