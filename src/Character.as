package  {
	
	import flash.geom.Point;
	
	public class Character extends Object_mc{
	
	protected var characterName:String;
	var talkPosition:Point = new Point(width/2, -height/2);
	public function Character(Position:Point,Name:String) {
		super(Position);
		characterName = Name;
		}
	public function getName():String {
			return characterName;
		}
		var talkChild:Talk_mc = null;
		public function talkingRange(inRange:Boolean) {
			if (inRange) {
				if (talkChild == null) {
					talkChild = new Talk_mc();
					talkChild.x = x+talkPosition.x;
					talkChild.y = y+talkPosition.y;
					stage.addChild(talkChild);
				}
			}
			else {
				if (talkChild != null) {
					stage.removeChild(talkChild);
					talkChild = null;
				}
			}
			
			
			
		}
	
	}
	
}
