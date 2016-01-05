package ;

/**
 *
 * Game.hx: This class handles instantiating new Game entities
 */
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.ui.Keyboard;
import flash.display.DisplayObject;
import openfl.display.BitmapData;

class Game extends Sprite
{
	//Variable used to pass in data back to the Simulator
	private var refSimulator : Simulator;
	
	//Variable used to declare new game in resttart function
	private var newGame : Simulator;
	
	//Game Object declaration
	public var player 		 : Player;
	public var walls 		 : Wall;
	private var rightObs	 : Enemy;
	private var leftObs 	 : Enemy;
	private var topObs 		 : Enemy;
	private var bottomObs 	 : Enemy;
	
	//UI stuff
	public var screenOver 	 : UI;
	private var startScreen	 : UI;			//Used for  our initial title screen
	public var score 		 : HUD;
	
	public function new(gui_container : DisplayObjectContainer, simulator : Simulator ) 
	{
		super();
		gui_container.addChild(this);
		this.refSimulator = simulator;
		
		//startScreen only runs once during initial program start. Otherwise, program goes straight
		//to gameInitialize()
		if (GameSettings.mainTitle)
		{
			startScreen = new UI(this, "Start", this);
		}
		else
		{
			gameInitialize();
		}

		//Event listeners to handle UI elements
		stage.addEventListener(KeyboardEvent.KEY_DOWN, start_Screen);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, restart_Game);	
	}
	
	/* Game logic execution*/
	public function startGame() : Void
	{
		//Obstacle movement and removal
			//Right Objects
		for (i in 0...refSimulator.rightObjects.length)
		{
			if (refSimulator.rightObjects[i].x < -10)
			{
				//Remember to remove the child first and then from the array, not the 
				//other way around
				removeChild(refSimulator.rightObjects[i]);
				refSimulator.remove_from_rightObjects(refSimulator.rightObjects[i]);
				rightObstacle();
			}
		}
		
			//Left Objects
		for (i in 0...refSimulator.leftObjects.length)
		{
			if (refSimulator.leftObjects[i].x > stage.stageWidth)
			{
				removeChild(refSimulator.leftObjects[i]);
				refSimulator.remove_from_leftObjects(refSimulator.leftObjects[i]);
				leftObstacle();
			}
		}
		
			//Top Objects
		for (i in 0...refSimulator.topObjects.length)
		{
			if (refSimulator.topObjects[i].y > stage.stageHeight)
			{
				removeChild(refSimulator.topObjects[i]);
				refSimulator.remove_from_topObjects(refSimulator.topObjects[i]);
				topObstacle();
			}
		}
		
				//Bottom Objects
		for (i in 0...refSimulator.bottomObjects.length)
		{
			if (refSimulator.bottomObjects[i].y < -10)
			{
				removeChild(refSimulator.bottomObjects[i]);
				refSimulator.remove_from_bottomObjects(refSimulator.bottomObjects[i]);
				bottomObstacle();
			}
		}
		gameCondition();
	}
	
	/* Game Conditions*/
	//Used for detecting game over condition
	public function gameCondition() : Void
	{
		detectObsCollisions();
		detectWallCollisions();
	}
		
	//Used for detecting player wall collisions
	private function detectWallCollisions(): Void
	{
		for (i in 0...refSimulator.playerObjects.length)
		{
			if (refSimulator.playerObjects[i].hitTestObject(walls.leftWall) )
			{
			refSimulator.playerObjects[i].set_speedX(0);
			refSimulator.playerObjects[i].set_speedY(0);
			//trace("left wall hit");
			}
			
			if (refSimulator.playerObjects[i].hitTestObject(walls.rightWall) )
			{
			refSimulator.playerObjects[i].set_speedX(0);
			refSimulator.playerObjects[i].set_speedY(0);
			//trace("right wall hit");
			}
			
			if (refSimulator.playerObjects[i].hitTestObject(walls.topWall) )
			{
			refSimulator.playerObjects[i].set_speedX(0);
			refSimulator.playerObjects[i].set_speedY(0);
			//trace("top wall hit");
			}
			
			if (refSimulator.playerObjects[i].hitTestObject(walls.bottomWall) )
			{
			refSimulator.playerObjects[i].set_speedX(0);
			refSimulator.playerObjects[i].set_speedY(0);
			//trace("right wall hit");
			}
		}
	}
	
	//Used for detecting player obstacle collisions
	private function detectObsCollisions() : Void
	{
		//Code for collisions
		for (i in 0...refSimulator.playerObjects.length)
		{
			for (b in 0...refSimulator.rightObjects.length)
			{
				if (refSimulator.playerObjects[i].hitTestObject(refSimulator.rightObjects[b]) )
				{	
					gameOver();
					//trace ("array length is now" + refSimulator.rightObjects.length);
					//trace ("player collided with right objects");
				}
			}
			
			for (b in 0...refSimulator.leftObjects.length)
			{
				if (refSimulator.playerObjects[i].hitTestObject(refSimulator.leftObjects[b]) )
				{	
					gameOver();
					//trace ("player collided with left objects");
				}
			}
			
			for (b in 0...refSimulator.topObjects.length)
			{
				if (refSimulator.playerObjects[i].hitTestObject(refSimulator.topObjects[b]) )
				{	
					gameOver();
					//trace ("player collided with top objects");
				}
			}
			
			for (b in 0...refSimulator.bottomObjects.length)
			{
				if (refSimulator.playerObjects[i].hitTestObject(refSimulator.bottomObjects[b]) )
				{	
					gameOver();
					//trace ("player collided with bottom objects");
				}
			}
			
			
		}
	}
	
	//Used for restarting game, game over
	function gameOver() : Void
	{
		refSimulator.stop_simulation();
		removeChild(player);
		for (i in 0...refSimulator.bottomObjects.length)
		{
			removeChild(refSimulator.bottomObjects[i]);
		}
		
		for (i in 0...refSimulator.topObjects.length)
		{
			removeChild(refSimulator.topObjects[i]);
		}
		
		for (i in 0...refSimulator.leftObjects.length)
		{
			removeChild(refSimulator.leftObjects[i]);	
		}
		
		for (i in 0...refSimulator.rightObjects.length)
		{
			removeChild(refSimulator.rightObjects[i]);
		}
		score.stopTimer();	
		/*
		refSimulator.bottomObjects = [];
		refSimulator.rightObjects = [];
		refSimulator.leftObjects = [];
		refSimulator.topObjects = [];
		*/
		//refSimulator.restart = true;
		GameSettings.restart = true;
		screenOver = new UI(this, "GameOver", this);		
	}
	
	/* Functions used by gameInitalize to create Game objects*/
	
		/* Player, walls, Score UI and initial starting point of stuff*/
	function gameInitialize() : Void
	{
		//Player declaration
		player = new Player(this);
		player.x = stage.stageWidth / 2;
		player.y = stage.stageHeight / 2 ;
		refSimulator.add_to_playerObjects(player);
		
		//Wall Declaration
		//createWalls();
		walls = new Wall(this, refSimulator);
		
		//Score title placement
		score = new HUD(this);
		//score.x = 150;
		//score.y = -155;
		score.y = -370;
				
		//Moving Obstacles Initial Call
		/* Incoming Right */
		for (i in 0...10)
		{
			rightObstacle();
			leftObstacle();
			topObstacle();
			bottomObstacle();
		}
		
	}
	
		/* Obstacle Creation*/
	
	public function bottomObstacle() : Void
	{
			bottomObs = new Enemy(this);
			bottomObs.set_direction(0, -1);
			bottomObs.x = Math.random() * stage.stageWidth;
			bottomObs.y = stage.stageHeight + (Math.random() * stage.stageHeight);
			refSimulator.add_to_bottomObjects(bottomObs);
	}
	
	public function topObstacle() : Void
	{
			topObs = new Enemy(this);
			topObs.set_direction(0, 1);
			topObs.x = Math.random() * stage.stageWidth;
			topObs.y = -100 * Math.random();
			refSimulator.add_to_topObjects(topObs);
	}
	
	public function leftObstacle() : Void
	{
			leftObs = new Enemy(this);
			leftObs.set_direction(1, 0);
			leftObs.x = Math.random() * -100;
			leftObs.y = Math.random() * stage.stageHeight;
			refSimulator.add_to_leftObjects(leftObs);
	}
	
	public function rightObstacle() : Void
	{
			rightObs = new Enemy(this);
			rightObs.set_direction( -1, 0);
			rightObs.x = stage.stageWidth + Math.random() * 100;
			rightObs.y = Math.random() * stage.stageHeight;
			refSimulator.add_to_rightObjects(rightObs); 
	}
	
	public function createWalls() : Void
	{
		var topWall : Sprite = new Sprite();
		topWall.graphics.beginFill(0x00AADD);
		topWall.graphics.drawRect(0, 0, stage.stageWidth, 10);
		topWall.graphics.endFill();
		addChild(topWall);
		refSimulator.add_to_gameObjects(topWall);
		
		var bottomWall : Sprite = new Sprite();
		bottomWall.graphics.beginFill(0x00AADD);
		bottomWall.graphics.drawRect(0, stage.stageHeight - 10, stage.stageWidth, 100);
		bottomWall.graphics.endFill();
		addChild(bottomWall);
		refSimulator.add_to_gameObjects(bottomWall);
		
		var leftWall : Sprite = new Sprite();
		leftWall.graphics.beginFill(0x00AADD);
		leftWall.graphics.drawRect(0, 0, 10, stage.stageHeight);
		leftWall.graphics.endFill();
		addChild(leftWall);
		refSimulator.add_to_gameObjects(leftWall);
		
		var rightWall : Sprite = new Sprite();
		rightWall.graphics.beginFill(0x00AADD);
		rightWall.graphics.drawRect(stage.stageWidth - 10, 0, 10, stage.stageHeight);
		rightWall.graphics.endFill();
		addChild(rightWall);
		refSimulator.add_to_gameObjects(rightWall);
		
	}
	
	/* UI functions and event listeners*/
	function restart_Game(event:KeyboardEvent) : Void
	{
		if (event.keyCode == Keyboard.ENTER && GameSettings.restart == true)
		{
			//removeChild(screenOver);
			while (numChildren > 0) 
			{
				removeChildAt(0);
			}
		
			this.newGame = new Simulator(this);
			this.newGame.start_simulation();
			GameSettings.restart = false;
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, restart_Game);
		}
	}
	
	function start_Screen(event:KeyboardEvent) : Void
	{
		if (event.keyCode == Keyboard.ENTER && GameSettings.mainTitle == true)
		{
		gameInitialize();
		removeChild(startScreen);
		GameSettings.mainTitle = false;
		
		stage.removeEventListener(KeyboardEvent.KEY_DOWN, start_Screen);	
		}
		
	}
	
	/* Debugging Functions*/
	function checkArrays(event:KeyboardEvent) : Void
	{
		if (event.keyCode == Keyboard.F1)
		{
			trace ("Bottom objects array length " + refSimulator.bottomObjects.length);
			trace ("top objects array length " +refSimulator.topObjects.length);
			trace ("left objects array length " +refSimulator.leftObjects.length);
			trace ("right objects array length " +refSimulator.rightObjects.length);
			trace ("Player score is " + score.getScore());
		}
	}
	
}