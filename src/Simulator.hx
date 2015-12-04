package ;

import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

/**
 *
 * Simulator.hx: This class handles the arrays and Game class instantiation
 */
class Simulator extends Sprite
{
	//Array variable declaration for game objects
	public var playerObjects	= new Array<Player>();
	public var rightObjects 	= new Array<Enemy>();
	public var leftObjects 		= new Array<Enemy>();
	public var topObjects 		= new Array<Enemy>();
	public var bottomObjects 	= new Array<Enemy>();
	public var gameObjects 		= new Array<Sprite>();
	
	//Game class declaration
	private var newGame : Game;
	
	public function new(gui_container : DisplayObjectContainer) 
	{
		super();
		gui_container.addChild(this);
		
		newGame = new Game(this, this);
	}
	
	/* Simulator Start, Run and Stop functions.  */
	public function start_simulation() : Void
	{
		this.addEventListener(Event.ENTER_FRAME, run_simulation);
	}
	
	public function stop_simulation() : Void
	{
		this.removeEventListener(Event.ENTER_FRAME, run_simulation);
	}
	
	public function run_simulation(event:Event) : Void
	{
		newGame.startGame();		
	}
	
	/* Game Array add and removal for different sections*/
	public function add_to_gameObjects(sprite : Sprite) : Void
	{
		gameObjects.push(sprite);
	}
	
	public function remove_from_gameObjects(sprite : Sprite) : Void
	{
		var index : Int = gameObjects.indexOf(sprite);
		if (index != -1)
		{
			gameObjects.splice(index, 1);
		}
	}
		
	/* Player Objects */
	public function add_to_playerObjects(player : Player) : Void
	{
		playerObjects.push(player);
	}
	
	public function remove_from_playerObjects(player : Player) : Void
	{
		var index : Int = playerObjects.indexOf(player);
		if (index != -1)
		{
			playerObjects.splice(index, 1);
		}
		//trace ("Player object at index" + index + "has been removed");
		//trace ("playerObjects array length is " + playerObjects.length);
	}
	
	/* Right obstacle objects */
	public function add_to_rightObjects(enemy : Enemy) : Void
	{
		rightObjects.push(enemy);
	}
	
	public function remove_from_rightObjects(enemy : Enemy) : Void
	{
		var index : Int = rightObjects.indexOf(enemy);
		if (index != -1)
		{
			rightObjects.splice(index, 1);
		}
		//trace ("Enemy object at index" + index + " has been removed");
		//trace ("rightObjects array length is " + rightObjects.length);
	}
	
	/* Left obstacle objects */
	
	public function add_to_leftObjects(enemy : Enemy) : Void
	{
		leftObjects.push(enemy);
	}
	
	public function remove_from_leftObjects(enemy : Enemy) : Void
	{
		var index : Int = leftObjects.indexOf(enemy);
		if (index != -1)
		{
			leftObjects.splice(index, 1);
		}
		//trace ("Enemy object at index" + index + " has been removed");
		//trace ("leftObjects array length is " + leftObjects.length);
	}
	
	/* Top obstacle objects */
	public function add_to_topObjects(enemy : Enemy) : Void
	{
		topObjects.push(enemy);
	}
	
	public function remove_from_topObjects(enemy : Enemy) : Void
	{
		var index : Int = topObjects.indexOf(enemy);
		if (index != -1)
		{
			topObjects.splice(index, 1);
		}
		//trace ("Enemy object at index" + index + " has been removed");
		//trace ("topObjects array length is " + leftObjects.length);
	}
	
	/* Bottom obstacle objects */
	public function add_to_bottomObjects(enemy : Enemy) : Void
	{
		bottomObjects.push(enemy);
	}
	
	public function remove_from_bottomObjects(enemy : Enemy) : Void
	{
		var index : Int = bottomObjects.indexOf(enemy);
		if (index != -1)
		{
			bottomObjects.splice(index, 1);
		}
		//trace ("Enemy object at index" + index + " has been removed");
		//trace ("bottomObjects array length is " + bottomObjects.length);
	}
}