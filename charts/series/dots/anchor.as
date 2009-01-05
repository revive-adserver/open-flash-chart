package charts.series.dots {
	
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.BlendMode;
	import charts.series.Element;
	import caurina.transitions.Tweener;
	import caurina.transitions.Equations;
	import string.Utils;
	import flash.geom.Point;
	
	public class anchor extends PointDotBase {
		
		public function anchor( index:Number, value:Object ) {
			
			//
			//
			//
			value = value as Properties;
			//
			//
			//
			
			// optional parameter defaults:
			var style:Object = {
				// these will be set by the parent (line, scatter, etc...)
				// are are here to prevent bugs...
				width:			2,
				colour:			'#3030d0',
				tip:			'Anchor [#x#,#y#] #size#',
				'dot-size':		5,
				'halo-size':	2,
				alpha:			1,
				// these are optional and may not be set
				rotation:		0,
				sides:			3
				
			};
			
			//object_helper.merge_2( value, style );
			style.colour = string.Utils.get_colour( style.get('colour') );
			
			// scatter charts have x, y (not value):
		//	if( style.value == null)
		//		style.value = style.y;

			super( index, style );

			this.visible = true;

			if (style.alpha == null)
				style.alpha = 1;

			this.tooltip = this.replace_magic_values( style.tip );
			this.attach_events();

			// if style.x is null then user wants a gap in the line
			//
			// I don't understand what this is doing...
			//
//			if (style.x == null)
//			{
//				this.visible = false;
//			}
//			else
//			{
				
				if (style.hollow)
				{
					// Hollow - set the fill to the background color/alpha
					if (style['background-colour'] != null)
					{
						var bgColor:Number = string.Utils.get_colour( style['background-colour'] );
					}
					else
					{
						bgColor = style.colour;
					}
					
					this.graphics.beginFill(bgColor, style['background-alpha']); 
				}
				else
				{
					// set the fill to be the same color and alpha as the line
					this.graphics.beginFill( style.colour, style.alpha );
				}

				this.graphics.lineStyle( style.width, style.colour, style.alpha );

				this.drawAnchor(this.graphics, this.radius, style.sides, rotation);
				// Check to see if part of the line needs to be erased
				//trace("haloSize = ", haloSize);
				if (style['halo-size'] > 0)
				{
					style['halo-size'] += this.radius;
					var s:Sprite = new Sprite();
					s.graphics.lineStyle( 0, 0, 0 );
					s.graphics.beginFill( 0, 1 );
					this.drawAnchor(s.graphics, style['halo-size'], style.sides, rotation);
					s.blendMode = BlendMode.ERASE;
					s.graphics.endFill();
					this.line_mask = s;
				}
//			}
			
		}
		
		
		public override function set_tip( b:Boolean ):void {
			if ( b )
			{
				if ( !this.is_tip )
				{
					Tweener.addTween(this, {scaleX:1.3, time:0.4, transition:"easeoutbounce"} );
					Tweener.addTween(this, {scaleY:1.3, time:0.4, transition:"easeoutbounce" } );
					if (this.line_mask != null)
					{
						Tweener.addTween(this.line_mask, {scaleX:1.3, time:0.4, transition:"easeoutbounce"} );
						Tweener.addTween(this.line_mask, {scaleY:1.3, time:0.4, transition:"easeoutbounce" } );
					}
				}
				this.is_tip = true;
			}
			else
			{
				Tweener.removeTweens(this);
				Tweener.removeTweens(this.line_mask);
				this.scaleX = 1;
				this.scaleY = 1;
				if (this.line_mask != null)
				{
					this.line_mask.scaleX = 1;
					this.line_mask.scaleY = 1;
				}
				this.is_tip = false;
			}
		}
		
		

		private function drawAnchor( aGraphics:Graphics, aRadius:Number, 
										aSides:Number, aRotation:Number ):void 
		{
			if (aSides < 3) aSides = 3;
			if (aSides > 360) aSides = 360;
			var angle:Number = 360 / aSides;
			for (var ix:int = 0; ix <= aSides; ix++)
			{
				// Move start point to vertical axis (-90 degrees)
				var degrees:Number = -90 + aRotation + (ix % aSides) * angle;
				var xVal:Number = calcXOnCircle(aRadius, degrees);
				var yVal:Number = calcYOnCircle(aRadius, degrees);
				
				if (ix == 0)
				{
					aGraphics.moveTo(xVal, yVal);
				}
				else
				{
					aGraphics.lineTo(xVal, yVal);
				}
			}
		}
		
	}
}