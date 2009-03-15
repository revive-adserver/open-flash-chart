package elements.menu {

	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.external.ExternalInterface;
	
	import flash.text.TextField;
    import flash.text.TextFieldType;
	import flash.text.TextFormat;

	public class CameraIcon extends menuItem {
		
		public function CameraIcon(chartId:String, props:Properties) {
			super(chartId, props);
		}
		
		protected override function add_elements(): Number {
	
			this.draw_camera();
			var width:Number = this.add_text(this.props.get('text'), 35);
			
			return width+30;	// 30 is the icon width
		}
		
		private function draw_camera():void {
			
			this.graphics.beginFill(0x000000, .2);
			this.graphics.drawRoundRect(2, 4, 26, 14, 2, 2);
			this.graphics.drawRect(20, 1, 5, 3);
			this.graphics.endFill();

			this.graphics.beginFill(0x000000, .3);
			this.graphics.drawCircle(9, 11, 4.5);
			this.graphics.endFill();
			
		}
	}
}
