package  {
	
	import flash.geom.Point;

	public class Bartering_mc extends Character{
		
	public function Bartering_mc(Position:Point,parentClip:Main,orignal:Boolean=true) {
		super(Position,parentClip, "Bartering thought",orignal);
		if (orignal) {
			var P:Player = parentClip.player_mc.clone()//player clone
			var T:Character = this.clone();//This clone
		dialog = [new Dialog(T, "OI, you need a drink?"),new Dialog(P, "Yes, all the drinks"),new Dialog(T, "I just sold those to the thing next to you, go fight him to the death to get them")];	
		}
		}
	}
	
}
