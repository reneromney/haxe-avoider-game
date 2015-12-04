package ;

import flash.display.Sprite;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;

/**
 * @author Romney Doria
 * Version 1.1
 * Completed 5/4/2014
 * Main.hx: Main class that instantiates a new simulator game file.
 */
class Main extends Sprite 
{
	var inited:Bool;
	//Git control test
	//Game instantiation variables
	public var newSimulator			: 	Simulator; 	//Starts our game simulator file
	
	/* ENTRY POINT */
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;
		//stage.scaleMode = StageScaleMode.EXACT_FIT; //Prevents scaling
		
		//Declares a new Simulator file and starts it
		this.newSimulator = new Simulator(this);
		this.newSimulator.start_simulation();
	}
	
	/* SETUP */
	/* Stuff added by OpenFl / Haxe*/
	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
 		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
