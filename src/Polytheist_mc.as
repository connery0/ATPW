package
{
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.geom.Point;
	
	public class Polytheist_mc extends Character
	{
	


		public function Polytheist_mc(Position:Point, parentClip:Main, orignal:Boolean = true)
		{
			super(Position, parentClip, "Conservative", orignal);
		
		}
		
		override protected function setDialog()
		{
			var P:Player = parentClip.player_mc.clone() //player clone
			var T:Character = this.clone(); //This clone
			var Bar:Bartering_mc = new Bartering_mc(new Point(0,0),parentClip,false);
			
			dialog = [	new Dialog(T, "Glory to Secular Thought! Only his leadership can get us out of this Nihilism mess!")];
			
		}
		
		override public function talkTo(e:Event)
		{
			if (talkChild != null)
			{ 
				if (parentClip.closestTalker == this) {
					parentClip.closestTalker = null;
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyPressed);}
				
				if(!parentClip.pickedAFight){
				startDialog(new Conversation(parentClip, dialog));
				}else{
				startDialog(new Conversation3(parentClip));
				}
			}
		}
		
		
		
		
	}

}
