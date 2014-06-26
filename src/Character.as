package
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.utils.getDefinitionByName;
	import flash.utils.getQualifiedClassName;
	
	public class Character extends Object_mc
	{
		
		protected var characterName:String;
		var talkPosition:Point = new Point(width / 2, -height / 2);
		var parentClip:Main;
		var dialog:Array;
		
		
		public function Character(Position:Point,parentClip:Main, Name:String,original:Boolean=true)
		{
			super(Position);
			this.parentClip = parentClip;
			characterName = Name;
			if(original){
			dialog = [new Dialog(this.clone(), "You havn't set dialog yet")];}
		}
		
		
		
		public function clone():Character {
				var AA:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
				var B:Character = new AA(new Point(0, 0), parentClip,false);
				return B;
		}
		
		
		public function talkTo(e:Event)
		{
			if (talkChild != null)
			{ 	
				parentClip.addChild(new Conversation(parentClip, dialog));
			}
		}

		
		public function getName():String
		{
			return characterName;
		}
		var talkChild:Talk_mc = null;
		
		public function talkingRange(inRange:Boolean)
		{
			if (inRange)
			{
				if (talkChild == null)
				{
					talkChild = new Talk_mc();
					talkChild.x = x + talkPosition.x;
					talkChild.y = y + talkPosition.y;
					stage.addChild(talkChild);
				}
			}
			else
			{
				if (talkChild != null)
				{
					stage.removeChild(talkChild);
					talkChild = null;
				}
			}
		
		}
	
	}

}
