package  {
	import flash.geom.Point;
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Conversation3 extends Conversation {
	
		public function Conversation3(Parent:Main) { 
			super(Parent,[	
							new Dialog(new Polytheist_mc(new Point(0,0),parentClass,false)	, "I’LL KILL YOU!"),
							new Dialog(new Player(parentClass, 1), "Oh come on, I just wanted a drink!"),
							new Dialog(new Polytheist_mc(new Point(0,0),parentClass,false), "GRRAGHHHHH!")
						]);
		}
	
		override protected function close() {
			parentClass.AddListeners();
			removeEventListener(MouseEvent.CLICK, click);
			parentClass.gotoAndStop("fight");
			parentClass.layer2.removeChild(this);
		}
		
	}
	
}
