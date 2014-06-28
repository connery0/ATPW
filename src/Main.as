package
{
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.net.Responder;
	import flash.text.*;
	
	/**
	 * ...
	 * @author Connesry0
	 */
	[Frame(factoryClass="Preloader")]
	
	public class Main extends MovieClip
	{
		var MousePoint:Point = new Point(0, 0);
		var T:TextField;
		var point1:Array = [0, 0];
		var player_mc:Player;
		
		var obstArray:Array;
		var charArray:Array;
		
		var layer1:Marker;
		var layer2:Marker;
		var closestTalker:Character = null;
		var pickedAFight:Boolean;
		
		var centerP:Marker;
		var talkrange:Array;
		var CurrentListeners:String = "";
		
		var CurrentLabel:String;
		var SubLabel:String = ""; //used in the fight
		
		public function Main():void
		{
			if (stage)
				init();
			else
				addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			///////////////////////////////////////////////////////////////
			// entry point                                               //
			///////////////////////////////////////////////////////////////
			addEventListener(Event.ENTER_FRAME, CheckLabel);
		
		}
		
		public function CheckLabel(e:Event):void
		{
			
			if ((MovieClip(this).currentLabel) != CurrentLabel)
			{
				switch (MovieClip(this).currentLabel)
				{
					case "intro": 
						CurrentListeners = "";
						CurrentLabel = "intro";
						trace("Cue music");
						break
					
					case "bar": 
						CurrentLabel = "bar"
						this.stop();
						BarCode();
						break
					
					case "fight": 
						stop();
						addListeners("fight");
						CurrentLabel = "fight";
						MovieClip(Kick_mc).addEventListener(MouseEvent.CLICK, atackClicked);
						MovieClip(Punch_mc).addEventListener(MouseEvent.CLICK, atackClicked);
						break
					case "prefight":
						while (layer1.numChildren > 0)
						{
							layer1.removeChildAt(0);
						}
						CurrentLabel = "prefight";
					break
					
					case "endPunch":
						gotoAndPlay("enemyAtack");
					break	
					case "endKick":
						gotoAndPlay("enemyAtack");
					break	
					case "endEnemyAtack":
						gotoAndStop("fight");
					break	
					
					default:
						CurrentLabel = MovieClip(this).currentLabel;
					break;
				
				}
				
			}
			if ((MovieClip(this).currentLabel) == "fight") {
				if ((MovieClip(Kick_mc).currentLabel) == "hide" || (MovieClip(Punch_mc).currentLabel) == "hide") {
					var target:String
						if (MovieClip(Kick_mc).currentLabel == "hide" ) {
								target="kick";
						}else {
							target="punch";
						}
					
						MovieClip(Kick_mc).gotoAndStop("hide");
						MovieClip(Punch_mc).gotoAndStop("hide");
						MovieClip(Charging_mc).gotoAndStop("hide");
						gotoAndPlay(target);
				}
			}
			
		
		}
		
		public function atackClicked(e:MouseEvent) {
			e.target.play();
			
		}
		
		public function BarCode():void
		{
			pickedAFight = true;
			layer1 = new Marker(new Point(0, 0));
			layer2 = new Marker(new Point(0, 0));
			
			addChild(layer1);
			addChild(layer2);
			
			player_mc = new Player(this);
			/////////////////////////////////////////////////
			obstArray = [new Table_mc(new Point(60, 288)), new Table_mc(new Point(500, 85)), new Table_mc(new Point(582, 294)), new Bar_mc(new Point(327, 360)), new BorderH(new Point(380, -44)), new BorderH(new Point(380, 510)), new BorderV(new Point(-39, 250)), new BorderV(new Point(840, 250))];
			charArray = [new Polytheist_mc(new Point(507, 300), this), new Pc_mc(new Point(78, 109), this), new Bartering_mc(new Point(323, 351), this), new Greedy_mc(new Point(560, 60), this), new Drunk_mc(new Point(45, 365), this)];
			//////////////////////////////////////////////////
			
			player_mc.x = 320;
			player_mc.y = 20;
			
			addListeners("bar");
			
			for (var i = 0; i < (obstArray.concat(charArray)).length; i++)
			{
				layer1.addChild((obstArray.concat(charArray))[i]);
			}
			
			playerpointery = player_mc.y;
			playerpointerx = player_mc.x;
			
			layer1.addChild(player_mc);
			
			CreateTalkRange(32, 60);
		}
		
		public function addListeners(ListenerType:String)
		{
			RemoveListeners();
			CurrentListeners = ListenerType;
			switch (ListenerType)
			{
				case "bar":
					
					stage.addEventListener(Event.ENTER_FRAME, UpdateGame);
					stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
					stage.addEventListener(MouseEvent.MOUSE_UP, mouseUp);
					stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
					stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
					
					for (var i = 0; i < charArray.length; i++)
					{
						Character(charArray[i]).addEventListener(MouseEvent.CLICK, Character(charArray[i]).talkTo);
					}
					break
			}
		
		}
		
		public function RemoveListeners()
		{
			switch (CurrentListeners)
			{
				case "bar": 
					stage.removeEventListener(Event.ENTER_FRAME, UpdateGame);
					stage.removeEventListener(MouseEvent.MOUSE_DOWN, mouseDown);
					stage.removeEventListener(MouseEvent.MOUSE_UP, mouseUp);
					stage.removeEventListener(KeyboardEvent.KEY_DOWN, keyDown);
					stage.removeEventListener(KeyboardEvent.KEY_UP, keyUp);
					
					for (var i = 0; i < charArray.length; i++)
					{
						Character(charArray[i]).removeEventListener(MouseEvent.CLICK, Character(charArray[i]).talkTo);
					}
					break
				
				default: 
					trace("Case broke (this should happen only once), current listener= " + CurrentListeners);
					break
			}
		}
		
		private function CreateTalkRange(dots:int, range:int)
		{
			talkrange = [];
			var centerPoint:Point = new Point(player_mc.x, player_mc.y - (player_mc.height / 2));
			
			centerP = new Marker(centerPoint);
			layer1.addChild(centerP);
			
			for (var i = 0; i < dots; i++)
			{
				var Angle = (2 * Math.PI / dots) * i;
				talkrange = talkrange.concat(new Marker(new Point(range * Math.cos(Angle), range * Math.sin(Angle))))
				centerP.addChild(talkrange[talkrange.length - 1]);
				
			}
		
		}
		
		var playerpointerx = 0;
		var playerpointery = 0;
		var mDown = false;
		
		private function mouseDown(e:Event)
		{
			mDown = true;
		
		}
		
		private function mouseUp(e:Event)
		{
			mDown = false;
		
		}
		
		private function Clicked(e:Event)
		{
			playerpointery = stage.mouseY;
			playerpointerx = stage.mouseX;
		}
		
		private function keyDown(e:KeyboardEvent)
		{
			
			switch (e.keyCode)
			{
				case 37: 
					playerpointerx = player_mc.x - 2000;
					break;
				
				case 38: 
					playerpointery = player_mc.y - 2000;
					break;
				
				case 39: 
					playerpointerx = player_mc.x + 2000;
					break;
				
				case 40: 
					playerpointery = player_mc.y + 2000;
					break;
			
			}
		
		}
		
		private function keyUp(e:KeyboardEvent)
		{
			
			switch (e.keyCode)
			{
				case 37: 
					playerpointerx = player_mc.x;
					break;
				
				case 38: 
					playerpointery = player_mc.y;
					break;
				
				case 39: 
					playerpointerx = player_mc.x;
					break;
				
				case 40: 
					playerpointery = player_mc.y;
					break;
			
			}
		}
		var Q:Boolean = true;
		
		private function UpdateGame(e:Event)
		{
			if (mDown)
			{
				playerpointery = stage.mouseY;
				playerpointerx = stage.mouseX;
			}
			
			MousePoint.x = stage.mouseX;
			MousePoint.y = stage.mouseY;
			
			player_mc.MoveTo(playerpointerx, playerpointery, 20);
			
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			centerP.x = player_mc.x;
			centerP.y = player_mc.y - player_mc.height / 2;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			
			for (var i = 0; i < charArray.length; i++)
			{
				var Q:Boolean = false;
				
				for (var j = 0; j < talkrange.length; j++)
				{
					if (charArray[i].Collide(talkrange[j].getPoint()))
					{
						talkrange[j].gotoAndPlay(2);
						Q = true;
					}
				}
				charArray[i].talkingRange(Q);
				
			}
		}
		
		public function getObjects():Array
		{
			return obstArray.concat(charArray);
		}
		
		public function MovePoint(toMove:Array, moveTo:Array, distance:int):Array
		{
			var Angle:Number = Math.atan((moveTo[1] - toMove[1]) / (moveTo[0] - toMove[0]));
			
			toMove[0] += distance * Math.cos(Angle);
			toMove[1] += distance * Math.sin(Angle);
			return toMove;
		
		}
	
	}

}