package  {
	
	import flash.geom.Point;
	
	public class Character extends Object_mc{
	
	protected var characterName:String;
	
	public function Character(Position:Point,Name:String) {
		super(Position);
		characterName = Name;
		}
	public function getName():String {
			return characterName;
		}
		
	
	}
	
}
