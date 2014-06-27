package  {
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	

	public class Conversation2 extends Conversation {
	var temp:intermission = new intermission();
		public function Conversation2(Parent:Main, A:Array) { 
			super(Parent, A);
			parentClass.layer2.addChild(temp);
		}	
		override protected function click(e:MouseEvent){
			if (index < A.length) {
				if (currentTalker != null) {
					MovieClip(pannel).removeChild(currentTalker);
				}
				nameText.text = Dialog(A[index]).naam;
				currentTalker = Dialog(A[index]).portrait;
				MovieClip(pannel).addChild(currentTalker);
				TalkText.text = Dialog(A[index]).text;
				index++;
			}
			else{	
			parentClass.layer2.removeChild(temp);
			close();
			}
			
		}
		
	}
	
}
