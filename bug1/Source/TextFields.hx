package;


import com.eclecticdesignstudio.motion.Actuate;
import nme.display.Sprite;
import nme.display.Bitmap;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.text.TextFormat;
import nme.text.TextField;
import nme.Assets;
import nme.Lib;

//tap screen once. Expected: red box stays in front of square.
//html5 gives the red box behind the square (but only when
//created in a onClick event).

class TextFields extends Sprite {
	
  var level:Sprite;

  public function setup_level():Void
  {
        while(level.numChildren>0)
            level.removeChildAt(0);

        var layer_background = new Sprite();
        var layer_top = new Sprite();
        level.addChild(layer_background);
        level.addChild(layer_top);
   
	// the selection is in the foreground layer layer_top:
	var selection = new Sprite();
        var b:Bitmap = new Bitmap(Assets.getBitmapData ("assets/a.png"));
        b.width=250;
        b.height=250;
        selection.addChild(b);       
	selection.y=32;
        layer_top.addChild(selection);

	//add a box to the normal layer:
	  {
	    var p:Sprite = new Sprite();
	    var b:Bitmap = new Bitmap(Assets.getBitmapData ("assets/b.png"));
	    b.width=64;
	    b.height=64;
	    p.addChild(b);
	    layer_background.addChild(p);
	  }
  }

	public function new () {
		
		super ();
		initialize ();

		level = new Sprite();
		addChild(level);

		//this is optional to see the bug after a click:
		setup_level();
	}
	
	
	private function initialize ():Void {
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
		Lib.current.stage.addEventListener (nme.events.MouseEvent.MOUSE_DOWN, onTap);
	}
	
  private function onTap (event:nme.events.MouseEvent):Void
  {
	  setup_level();
  }
	
	public static function main () {
		Lib.current.addChild (new TextFields ());
		
	}
	
}