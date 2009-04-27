package elements.axis {
	import flash.text.TextField;
	
	public class YAxisLabelsLeft extends YAxisLabelsBase {

		public function YAxisLabelsLeft(json:Object) {
			
			var values:Array;
			var s:String;
			var axis_name:String = 'y_axis';
			
			this.lblText = "#val#";
			this.i_need_labels = true;
			
			// TODO: refactor
			if( json[axis_name] )
			{
				if ( json[axis_name].labels is Object ) 
				{
					if ( json[axis_name].labels.text is String )
						this.lblText = json[axis_name].labels.text;

					var visibleSteps:Number = 1;
					if( json[axis_name].steps is Number )
						visibleSteps = json[axis_name].steps;
						
					if( json[axis_name].labels.steps is Number )
						visibleSteps = json[axis_name].labels.steps;
					
					if ( json[axis_name].labels.labels is Array )
					{
						values = [];
						// use passed in min if provided else zero
						var label_pos:Number = (json[axis_name] && json[axis_name].min) ? json[axis_name].min : 0;
						
						for each( var obj:Object in json.y_axis.labels.labels )
						{
							if(obj is Number)
							{
								values.push( { val:lblText, pos:obj } );
								//i = (obj > i) ? obj as Number : i;
							}
							else if(obj is String)
							{
								values.push( {
									val:	obj,
									pos:	label_pos,
									visible:	((label_pos % visibleSteps) == 0)
									} );
								//i = (obj > i) ? obj as Number : i;
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
								//i = (obj.y > i) ? obj.y : i;
							}
							
							label_pos++;
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