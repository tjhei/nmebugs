package;


import com.eclecticdesignstudio.motion.Actuate;
import nme.display.Sprite;
import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.text.TextFormat;
import nme.text.TextField;
import nme.Assets;
import nme.Lib;

// onClick on a Sprite that is scaled with ScaleX/Y >1
// sometimes does not trigger in the bottom right corner.

// click the square in the bottom right corner and
// watch the two counters.

class TextFields extends Sprite {

  var bg : Sprite;
  var sp : Sprite;
  var textField : TextField;

	public function new () {
		
		super ();
		
		initialize ();

		bg = new Sprite();
		addChild(bg);

		var font = Assets.getFont ("assets/VeraSe.ttf");
		var format = new TextFormat (font.fontName, 24, 0xFF0000);
		
		textField = new TextField ();
		textField.defaultTextFormat = format;
		textField.selectable = false;
		textField.embedFonts = true;
		textField.width = 160;
		textField.height = 40;
		textField.x = 20;
		textField.y = 20;
		textField.text = "click the square at the bottom right corner repeatedly";
		bg.addChild (textField);

		sp = new Sprite();
		sp.y=50;
		sp.x=50;
		sp.width=50;
		sp.height=50;
		update();
		addChild(sp);
		sp.addEventListener (nme.events.MouseEvent.CLICK, function (e)
				     {i2++; 
				       status++; 
				       if (status==3) status=0; 
				       update();
				       trace("onClickButton: " + i2);
				       });
		sp.scaleX=2.0;
		sp.scaleY=2.0;
		Lib.current.stage.addEventListener (nme.events.MouseEvent.MOUSE_DOWN, onTap);

		textField.text = "click the square at the bottom right corner repeatedly";
	}
    private function onTap (event:nme.events.MouseEvent):Void
    {
      i1++;
      trace("onClick: " + i1);
      update();
    }

  var status:Int = 0;

  var i1:Int = 0;
  var i2:Int = 0;

  private function update()
  {
    textField.text = Std.format("mousedown/onclick: $i1 / $i2");
    
    sp.graphics.clear();
    
    if (status==0)
      sp.graphics.beginFill(0xff0000,1.0);
    else if (status==1)
      sp.graphics.beginFill(0x00ff00,1.0);
    else if (status==2)
      sp.graphics.beginFill(0x0000ff,1.0);

    sp.graphics.drawRect(0,0,50,50);
    sp.graphics.endFill();
  }

	
	private function initialize ():Void {
		
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;
	}
	
	
	public static function main () {
		Lib.current.addChild (new TextFields ());
		
	}
	
}