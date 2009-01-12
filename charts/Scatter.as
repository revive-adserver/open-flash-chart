package charts {

	import string.Utils;
	import charts.series.dots.DefaultDotProperties;
	
	public class Scatter extends ScatterBase
	{
		
		
		public function Scatter( json:Object )
		{
			this.style = {
				values:			[],
				width:			2,
				colour:			'#3030d0',
				text:			'',		// <-- default not display a key
				'font-size':	12,
				tip:			'[#x#,#y#] #size#'
			};
			
			this.default_style = new DefaultDotProperties(
				json['dot-style'], '[#x#,#y#] #size#', '#3030d0');
			
			object_helper.merge_2( json, style );
			
			this.line_width = style.width;
			this.colour		= string.Utils.get_colour( style.colour );
			this.key		= style.text;
			this.font_size	= style['font-size'];
			this.circle_size = style['dot-size'];
			
			for each( var val:Object in style.values )
			{
				if( val['dot-size'] == null )
					val['dot-size'] = style['dot-size'];
			}
			
			this.values = style.values;

			this.add_values();
		}
	}
}