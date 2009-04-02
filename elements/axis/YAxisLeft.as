package elements.axis {
	import flash.display.Sprite;
	
	public class YAxisLeft extends YAxisBase {

		function YAxisLeft( json:Object ) {
			
			super( json, 'y_axis' );
			
			this.labels = new YAxisLabelsLeft( this, json );
			this.addChild( this.labels );
		}
		
		public override function get_style():Object {
			//
			// default values for a left axis
			//
			var style:Object = {
				stroke:			2,
				'tick-length':	3,
				colour:			'#784016',
				offset:			false,
				'grid-colour':	'#F5E1AA',
				'grid-visible':	true,
				'3d':			0,
				steps:			1,
				visible:		true,
				min:			0,
				max:			10,
				auto_size:		false
			};
			
			return style;
		}
		
		public override function resize( label_pos:Number, sc:ScreenCoords ):void {
			
			super.resize_helper( label_pos, sc, false);
		}
	}
}