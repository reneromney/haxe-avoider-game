package ;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

/**
 *
 * Wall.hx: This class handles declaring new walls. A wall is created top, bottom, right and left in a single class and passed
 * to the simulator array.
 */

class Wall extends Sprite
{
	var color : UInt = 0xFFFFFF;
	var refSimulator : Simulator; //Used to reference back to simulator
	public var topWall : Sprite = new Sprite();
	public var bottomWall : Sprite = new Sprite();
	public var leftWall : Sprite = new Sprite();
	public var rightWall : Sprite = new Sprite();
	public function new(gui_container : DisplayObjectContainer, enter_simulator : Simulator) 
	{
		super();
		gui_container.addChild(this);
		refSimulator = enter_simulator;
		this.createWalls();
	}
	
	public function createWalls() : Void
	{
		topWall.graphics.beginFill(color);
		topWall.graphics.drawRect(0, 0, stage.stageWidth, 30);
		topWall.graphics.endFill();
		addChild(topWall);
		refSimulator.add_to_gameObjects(topWall);
		
		bottomWall.graphics.beginFill(color);
		bottomWall.graphics.drawRect(0, stage.stageHeight - 30, stage.stageWidth, 60);
		bottomWall.graphics.endFill();
		addChild(bottomWall);
		refSimulator.add_to_gameObjects(bottomWall);
		
		leftWall.graphics.beginFill(color);
		leftWall.graphics.drawRect(0, 0, 30, stage.stageHeight);
		leftWall.graphics.endFill();
		addChild(leftWall);
		refSimulator.add_to_gameObjects(leftWall);
		
		rightWall.graphics.beginFill(color);
		rightWall.graphics.drawRect(stage.stageWidth - 30, 0, 30, stage.stageHeight);
		rightWall.graphics.endFill();
		addChild(rightWall);
		refSimulator.add_to_gameObjects(rightWall);
		
	}
	
}