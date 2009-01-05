package charts.series.dots {

	public class DefaultDotProperties extends Properties
	{
		//
		// things that all dots share
		//
		public function DefaultDotProperties( json:Object, tip:String, colour:String) {
			tr.ace_json(json);
			
			// the user JSON can override any of these:
			var parent:Properties = new Properties( {
				'type':			'dot',
				'dot-size': 	5,
				'halo-size':	2,
				'on-click':		null,
				'colour':		colour,
				'tip':			tip,
				alpha:			1,
				// this is for anchors:
				rotation:		0,
				sides:			3
				} );
				
				
				
			super( json, parent );
				
			tr.aces('4', this.get('colour'));
			tr.aces('4', this.get('type'));
		}
	}
}