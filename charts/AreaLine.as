package charts {
	import charts.series.dots.Point;
	import charts.series.Element;
	
	public class AreaLine extends AreaBase {
		
		public function AreaLine( json:Object ) {
			
			super( json );
		}
		
		//
		// called from the base object
		/*
		protected override function get_element( index:Number, value:Object ): Element {
			
			var s:Object = this.merge_us_with_value_object( value );
			return new ChartObjects.Elements.Point( index, s );
		}
		*/
	}
}