package;


import com.eclecticdesignstudio.motion.Actuate;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.text.TextFormat;
import nme.text.TextField;
import nme.Assets;
import nme.Lib;

// TextField.height is not correct in html5.
// expected: green box at the top left corner, got: red box.

class TextFields extends Sprite {

  var bg : Sprite;

	public function new () {
		
		super ();
		
		initialize ();

		bg = new Sprite();
		bg.graphics.clear();
                bg.graphics.beginFill(0x0000aa,1.0);
                bg.graphics.drawRect(0,0,200,50);
                bg.graphics.endFill();

		addChild(bg);

		var font = Assets.getFont ("assets/VeraSe.ttf");
		var format = new TextFormat (font.fontName, 24, 0xFF0000);
		
		var textField = new TextField ();
		textField.defaultTextFormat = format;
		textField.selectable = false;
		textField.embedFonts = true;
		textField.width = 160;
		textField.height = 40;
		textField.x = 20;
		textField.y = 20;
		
		textField.text = "Hello World!";
		bg.addChild (textField);

		//on flash/android textField.height is now 40,
		//but on html5 it is around 24.3 which is probably
		//related to the font size
		trace(textField.height);

		//we output a red/green/gray box to tell us
		//quickly, what textField.height is.
		//correct: green, wrong: red.
		var x = new Sprite();
		x.graphics.clear();
		if (Math.abs(textField.height-24.0)<1.0)
		  x.graphics.beginFill(0xff0000,1.0);
		else if (Math.abs(textField.height-40.0)<1.0)
		  x.graphics.beginFill(0x00ff00,1.0);
		else
		  x.graphics.beginFill(0xaaaaaa,1.0);

                x.graphics.drawRect(0,0,50,50);
                x.graphics.endFill();

		addChild(x);
	}
	
	
	private function initialize ():Void {
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
	}
	
	
	public static function main () {
		Lib.current.addChild (new TextFields ());
		
	}
	
}