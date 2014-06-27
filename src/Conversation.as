package  {
	

	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	
	public class Conversation extends MovieClip {
		var parentClass:Main;
		var index:int;
		var A:Array;
		var currentTalker:MovieClip=null;
		public function Conversation(parent:Main, A:Array) {
			index = 0;
			this.parentClass = parent;
			parent.RemoveListeners();
			this.A = A;
			addEventListener(MouseEvent.CLICK, click);
			click(null);
		}
		
		protected function click(e:MouseEvent) {
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
			
			close();
			}
			
		}
		
		protected function close() {
			parentClass.AddListeners();
			removeEventListener(MouseEvent.CLICK, click);
			parentClass.layer2.removeChild(this);
		}
	}
	
}
