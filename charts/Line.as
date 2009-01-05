package charts {

	import flash.events.Event;
	import flash.events.MouseEvent;
	import charts.series.Element;
	import charts.Elements.Point;
	import string.Utils;
	import flash.display.BlendMode;
	
	import charts.series.dots.DefaultDotProperties;
	
	public class Line extends LineBase
	{
		
		public function Line( json:Object ) {
		
			var p:Properties = new Properties( { colour:'ffff00', width:5 } );
			var q:Properties = new Properties( { colour:'red' }, p );
			
			tr.aces('1', p.get('colour'));
			tr.aces('2', q.get('colour'), q.get('width'));
			tr.aces('3', q.get('moo'));
			
			
			
			this.style = {
				values: 		[],
				width:			2,
				colour: 		'#3030d0',
				text: 			'',		// <-- default not display a key
				'font-size': 	12,
				tip:			'#val#',
				'line-style':	new LineStyle( json['line-style'] ),
				loop:			false,
				axis:			'left',
				// default dot:
				// HACK: fix this (remove the merge below)
				'--dot-style':	new DefaultDotProperties(json['dot-style'],'#val#','#3030d0')
				
			};
			
			object_helper.merge_2( json, this.style );
	tr.ace(5);
			this.style.colour = string.Utils.get_colour( this.style.colour );
			
			this.key		= this.style.text;
			this.font_size	= this.style['font-size'];
	tr.ace(6);
				
			this.values = this.style.values;
			this.add_values();

			//
			// this allows the dots to erase part of the line
			//
			this.blendMode = BlendMode.LAYER;
			
		}
	}
}