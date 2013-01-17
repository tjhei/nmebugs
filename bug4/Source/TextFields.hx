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
import flash.events.Event;

//We expect the two bitmaps B to be behind the big red A because they are in
//the background layer. This is the case when the app is started, but not if
//the objects are removed and new ones are added again in the onClick handler.

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

	//add 2 boxes to the normal layer:
	for (i in 0...2)
	  {
	    var p:Sprite = new Sprite();
	    var b:Bitmap = new Bitmap(Assets.getBitmapData ("assets/b.png"));
	    b.width=64;
	    b.height=64;
	    b.x=64*i;
	    p.addChild(b);
	    layer_background.addChild(p);
	  }
  }

  public function new () {
		
    super ();
    initialize ();
    
    level = new Sprite();
    addChild(level);
    
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