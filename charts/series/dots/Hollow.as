package charts.series.dots {
	
	import charts.series.dots.PointDotBase;
	import flash.display.BlendMode;
	import flash.display.Sprite;
	
	public class Hollow extends PointDotBase {
		
		public function Hollow( index:Number, style:Object ) {
			tr.aces('h i', index);
			super( index, style );
			
			this.visible = true;
			
			this.graphics.clear();
			//
			// fill a big circle
			//
			this.graphics.lineStyle( 0, 0, 0 );
			this.graphics.beginFill( style.colour, 1 );
			this.graphics.drawCircle( 0, 0, style['dot-size']);
			//
			// punch out the hollow circle:
			//
			this.graphics.drawCircle( 0, 0, style['dot-size']-style.width);
			this.graphics.endFill();	// <-- LOOK
			//
			// HACK: we fill an invisible circle over
			//       the hollow circle so the mouse over
			//       event fires correctly (even when the
			//       mouse is in the hollow part)
			//
			this.graphics.lineStyle( 0, 0, 0 );
			this.graphics.beginFill(0, 0);
			this.graphics.drawCircle( 0, 0, style['dot-size'] );
			this.graphics.endFill();
			//
			// MASK
			//
			var s:Sprite = new Sprite();
			s.graphics.lineStyle( 0, 0, 0 );
			s.graphics.beginFill( 0, 1 );
			s.graphics.drawCircle( 0, 0, style['dot-size'] + style['halo-size'] );
			s.blendMode = BlendMode.ERASE;
			
			this.line_mask = s;
			this.attach_events();
			
		}
	}
}

