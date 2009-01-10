package elements {

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;

	public class CameraIcon extends Sprite {
		private var chartId:String;

		public function CameraIcon(chartId:String) {
			
			this.buttonMode = true;
			this.useHandCursor = true;
			this.chartId = chartId;
			
			
			this.alpha = 0.5;
			
			this.graphics.beginFill(0xffffff, .8);
			this.graphics.drawRoundRect(0, 0, 80, 20, 5, 5 );
			this.graphics.endFill();
			
			this.graphics.beginFill(0x000000, .2);
			this.graphics.drawRoundRect(0, 0, 30, 15, 2, 2);
			this.graphics.drawRect(3, 3, 5, 3);
			this.graphics.endFill();

			this.graphics.beginFill(0x000000, .3);
			this.graphics.drawCircle(6, 7, 5);
			this.graphics.endFill();

			this.addEventListener(MouseEvent.CLICK, mouseClickHandler);
			this.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			this.addEventListener(MouseEvent.MOUSE_OVER, mouseOverHandler);
			this.addEventListener(MouseEvent.MOUSE_OUT, mouseOutHandler);
		}

		public function mouseClickHandler(event:MouseEvent):void {
			this.alpha = 0.0;
			tr.ace('Save Image');
			ExternalInterface.call("save_image", this.chartId);
			this.alpha = 1.0;
		}

		public function mouseOverHandler(event:MouseEvent):void {
			this.alpha = 0.9;
		}
		
		public function mouseDownHandler(event:MouseEvent):void {
			this.alpha = 1.0;
		}

		public function mouseOutHandler(event:MouseEvent):void {
			this.alpha = 0.5;
		}
	}
}
