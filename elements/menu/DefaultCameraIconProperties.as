package elements {

	public class DefaultCameraIconProperties extends Properties
	{
		public function DefaultCameraIconProperties( json:Object ) {
			
			// the user JSON can override any of these:
			var parent:Properties = new Properties( {
				'colour':				'#0000E0',
				'text':					"Save chart",
				'javascript-function':	"save_image"
				} );
			
			super( json, parent );
	
		}
	}
}