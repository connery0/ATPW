package  {
	
	import flash.display.MovieClip;
	import flash.geom.Point;
	
	
	public class Marker extends MovieClip {
		
		
		public function Marker(P:Point) {
			this.x = P.x;
			this.y = P.y;			
		}
		public function getPoint():Point {
			return  this.localToGlobal(new Point(0, 0));
		}
	
	}
	
}
