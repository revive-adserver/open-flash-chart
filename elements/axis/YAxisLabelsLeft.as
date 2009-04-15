package elements.axis {
	import flash.text.TextField;
	
	public class YAxisLabelsLeft extends YAxisLabelsBase {

		public function YAxisLabelsLeft(json:Object) {
			
			var values:Array;
			var i:Number;
			var s:String;
			
			this.lblText = "#val#";
			this.i_need_labels = true;
			
			// TODO: refactor
			if( json.y_axis )
			{
				if ( json.y_axis.labels is Object ) 
				{
					if ( json.y_axis.labels.text is String )
						this.lblText = json.y_axis.labels.text;

					if ( json.y_axis.labels.labels is Array )
					{
						values = [];
						for each( var obj:Object in json.y_axis.labels.labels )
						{
							if (obj is Number) 
							{
								values.push( { val:lblText, pos:obj } );
								i = (obj > i) ? obj as Number : i;
							}
							else if (obj.y is Number)
							{
								s = (obj.text is String) ? obj.text : lblText;
								var lblStyle:Object = { val:s, pos:obj.y }
								if (obj.colour != null)
									lblStyle.colour = obj.colour;
									
								if (obj.size != null)
									lblStyle.size = obj.size;
									
								if (obj.rotate != null)
									lblStyle.rotate = obj.rotate;
									
								values.push( lblStyle );
								i = (obj.y > i) ? obj.y : i;
							}
						}
						this.i_need_labels = false;
					}
				}				
			}
			
			super(values,1,json,'y_label_','y_axis');
		}

		// move y axis labels to the correct x pos
		public override function resize( left:Number, sc:ScreenCoords ):void {
			
			var maxWidth:Number = this.get_width();
			var i:Number;
			var tf:YTextField;
			
			for( i=0; i<this.numChildren; i++ ) {
				// right align
				tf = this.getChildAt(i) as YTextField;
				tf.x = left - tf.width + maxWidth;
			}
			
			// now move it to the correct Y, vertical center align
			for ( i=0; i < this.numChildren; i++ ) {
				tf = this.getChildAt(i) as YTextField;
				if (tf.rotation != 0) {
					tf.y = sc.get_y_from_val( tf.y_val, false ) + (tf.height / 2);
				}
				else {
					tf.y = sc.get_y_from_val( tf.y_val, false ) - (tf.height / 2);
				}
				
				//
				// this is a hack so if the top
				// label is off the screen (no chart title or key set)
				// then move it down a little.
				//
				if (tf.y < 0 && sc.top == 0) // Tried setting tf.height but that didnt work 
					tf.y = (tf.rotation != 0) ? tf.height : tf.textHeight - tf.height;
			}
		}
	}
}