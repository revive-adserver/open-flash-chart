package elements {

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import elements.CameraIcon;
	import caurina.transitions.Tweener;
	import caurina.transitions.Equations;

	public class Menu extends Sprite {
		
		public function Menu(chartId:String) {
			
			var camera_icon:CameraIcon = new CameraIcon(chartId);
			camera_icon.x = 5;
			camera_icon.y = 5;
			this.addChild(camera_icon);
			
			this.draw(camera_icon.width);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}
		
		private function draw( width:Number ): void {
			
			this.graphics.clear();
			
			this.graphics.beginFill(0x000000, .3);
			this.graphics.moveTo( 0, 0 );
			this.graphics.lineTo( 0, 30 );
			this.graphics.lineTo( width-25, 30 );
			this.graphics.lineTo( width-20, 40 );
			this.graphics.lineTo( width, 40 );
			this.graphics.lineTo( width, 0 );
			
			this.graphics.endFill();
		}
		
		public function mouseOverHandler(event:MouseEvent):void {
			Tweener.removeTweens(this);
			Tweener.addTween(this, { y:0, time:0.4, transition:Equations.easeOutBounce } );
			Tweener.addTween(this, { alpha:1, time:0.4, transition:Equations.easeOutBounce } );
		}

		public function mouseOutHandler(event:MouseEvent):void {
			Tweener.removeTweens(this);
			Tweener.addTween(this, { y:-30, time:0.4, transition:Equations.easeOutBounce } );
			Tweener.addTween(this, { alpha:0.6, time:0.4, transition:Equations.easeOutBounce } );
		}
		
		public function resize(): void {
			//
			//this.stage.stageHeight
			
			this.x = this.stage.stageWidth - this.width - 10;
			this.y = -(this.height) + 10;
			
		}
	}
}