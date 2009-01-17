package elements {

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import elements.CameraIcon;
	import caurina.transitions.Tweener;
	import caurina.transitions.Equations;
	import string.Utils;

	public class Menu extends Sprite {
		
		private var original_alpha:Number;
		private var props:Properties;
		
		public function Menu( chartId:String, json:Object ) {
			
			this.props = new DefaultMenuProperties(json);
			
			this.original_alpha = this.alpha = 0.4;
			
			var camera_icon:CameraIcon = new CameraIcon(chartId, this.props.get('camera-text'));
			camera_icon.x = 5;
			camera_icon.y = 5;
			this.addChild(camera_icon);
			
			this.draw(camera_icon.width+10);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		
		private function draw( width:Number ): void {
			
			this.graphics.clear();
			
			var colour:Number = string.Utils.get_colour( this.props.get('colour') );
			var o_colour:Number = string.Utils.get_colour( this.props.get('outline-colour') );
			
			this.graphics.lineStyle( 1, o_colour );
			this.graphics.beginFill(colour, 1);
			this.graphics.moveTo( 0, 0 );
			this.graphics.lineTo( 0, 30 );
			this.graphics.lineTo( width-25, 30 );
			this.graphics.lineTo( width-20, 40 );
			this.graphics.lineTo( width, 40 );
			this.graphics.lineTo( width, 0 );
			this.graphics.endFill();
			
			// arrows
			this.graphics.lineStyle( 1, o_colour );
			this.graphics.moveTo( width-15, 33 );
			this.graphics.lineTo( width-10, 38 );
			this.graphics.lineTo( width - 5, 33 );
			
			this.graphics.moveTo( width-15, 30 );
			this.graphics.lineTo( width-10, 35 );
			this.graphics.lineTo( width - 5, 30 );
			
		}
		
		public function mouseOverHandler(event:MouseEvent):void {
			Tweener.removeTweens(this);
			Tweener.addTween(this, { y:0, time:0.4, transition:Equations.easeOutBounce } );
			Tweener.addTween(this, { alpha:1, time:0.4, transition:Equations.easeOutBounce } );
		}

		public function mouseOutHandler(event:MouseEvent):void {
			Tweener.removeTweens(this);
			Tweener.addTween(this, { y:-30, time:0.4, transition:Equations.easeOutBounce } );
			Tweener.addTween(this, { alpha:this.original_alpha, time:0.4, transition:Equations.easeOutBounce } );
		}
		
		public function resize(): void {
			//
			//this.stage.stageHeight
			
			this.x = this.stage.stageWidth - this.width - 5;
			this.y = -(this.height) + 10;
			
		}
	}
}