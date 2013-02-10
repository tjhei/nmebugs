import nme.display.Sprite;


// unserializing a Hash<Array<Int>> seems to be broken in any
// cpp target. Changes will just be forgotten.
// output with hxcpp: [2.10], nme 3.5.5/3.6.0:

//Main.hx:21: old array: 0 0 0 0 1
//Main.hx:23: the following two should be the same:
//Main.hx:24: new array: 0 2 0 0 1
//Main.hx:25: newer array: 0 0 0 0 1

//output flash: new array = newer array, but ' ' instead of 0, why?

class Main extends Sprite {
	
	public function new () {
		
		super ();
		var save:String;
		{
		  var lvls = new Hash<Array<Int>>();
		
		  lvls.set("arr", new Array<Int>());
		  var arr:Array<Int> = lvls.get("arr");
		  arr[4]=1;
		  save = haxe.Serializer.run(lvls);
		}
		{
		  var lvls = haxe.Unserializer.run(save);
		  var arr:Array<Int> = lvls.get("arr");
		  trace("old array: " + arr.join(" "));
		  arr[1]=2;
		  //lvls.set("arr", arr);
		  trace("the following two should be the same:");
		  trace("new array: " + arr.join(" "));
		  trace("newer array: " + lvls.get("arr").join(" "));		
		}		
	}	
	
}