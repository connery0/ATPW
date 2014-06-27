package
{
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	public class Polytheist_mc extends Character
	{
	
		var pickedAFight:Boolean=false
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
				startDialog(new Conversation(parentClip, [new Dialog(new AyeAye(),"And now the fight would start")]));
				}
			}
		}
		
		
		
		
	}

}
