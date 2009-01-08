package charts.series.dots {
	import charts.series.dots.scat;
	import charts.Elements.Point;
	
	public class dot_factory {
		
		public static function make( index:Number, style:Object ):PointDotBase {
			
		tr.ace(8);
			style = style as Properties;
			tr.aces( 'dot factory type:', style.get('type'));
			
			if ( (style.get('type') != 'anchor' ) && (style.get('type') != 'dot' )
			&& (style.get('type') != 'hollow-dot' ))
				style.set('type', 'anchor');
				
			tr.aces( 'dot factory type:', style.get('type'));
			
			
			switch( style.get('type') )
			{
				case 'star':
					return new star(index, style);
					break;
				
				case 'anchor':
					return new anchor(index, style);
					break;
				
				case 'dot':
					return new charts.Elements.Point(index, style);
					break;
				
				case 'solid-dot':
					return new PointDot(index, style);
					break;
					
				case 'hollow-dot':
					return new Hollow(index, style as Properties);
					break;
					
				default:
					return new scat(style);
					break;
			}
		}
	}
}