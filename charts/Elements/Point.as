package charts.Elements {
	
	import charts.series.dots.PointDotBase;
	import flash.display.Sprite;
	import flash.display.BlendMode;
	
	
	public class Point extends PointDotBase {
		
		public function Point( index:Number, style:Object )
		{
			super( index, style );
			
			this.graphics.lineStyle( 0, 0, 0 );
			this.graphics.beginFill( style.colour, 1 );
			this.graphics.drawCircle( 0, 0, style['dot-size'] );
			this.visible = false;
			this.attach_events();
			
			var s:Sprite = new Sprite();
			s.graphics.lineStyle( 0, 0, 0 );
			s.graphics.beginFill( 0, 1 );
			s.graphics.drawCircle( 0, 0, style['dot-size']+style['halo-size'] );
			s.blendMode = BlendMode.ERASE;
			s.visible = false;
			
			this.line_mask = s;
		}
		
		public override function set_tip( b:Boolean ):void {
			
			this.visible = b;
			this.line_mask.visible = b;
		}
	}
}