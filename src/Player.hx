package ;


import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.Lib;
import flash.ui.Keyboard;

/**
 *
 * Game.hx: This class handles instantiating the player entity and controls. Draws on finite state 
 * principles between move and key_down functions
 */
class Player extends Sprite
{	
	private var moveRight : Int = 0;
	private var moveLeft : Int = 1;
	private var moveUp : Int = 2;
	private var moveDown : Int = 3;
	private var mode : Int;
	
	private var speed : Int = 0;
	
	private var speedX : Float = 0;
	private var speedY : Float = 0;
	
	function new(gui_container : DisplayObjectContainer) 
	{
		super();
		gui_container.addChild(this);
		
		this.create_display_list();
		stage.addEventListener(KeyboardEvent.KEY_DOWN, key_down);
		stage.addEventListener(Event.ENTER_FRAME, move);
	}
		
	private function create_display_list() : Void
	{	
		this.graphics.beginFill(0x881400);
		this.graphics.drawRect(0, 0, 20, 20);
		this.graphics.endFill();
	}
	
	
	public function key_down(event:KeyboardEvent) : Void
	{
		if (event.keyCode == Keyboard.RIGHT)
		{
			//mode = 0;
			if (speedX > 2)
			{
				speedX += 0;
			} else
			{
				speedX += .5;
			}
		}
		
		if (event.keyCode == Keyboard.LEFT)
		{
			//mode = 1;
			if (speedX < -2)
			{
				speedX += 0;
			} else
			{
				speedX -= .5;
			}
			
		}
		
		if (event.keyCode == Keyboard.UP)
		{
			//mode = 2;
			if (speedY < -2)
			{
				speedY += 0;
			} else
			{
				speedY -= .5;
			}
		}
		
		if (event.keyCode == Keyboard.DOWN)
		{
			//mode = 3;
			if (speedY > 2)
			{
				speedY += 0;
			}
			else
			{
				speedY += .5;
			}
		}
	}
	
	/*
	public function key_down(event:KeyboardEvent) : Void
	{
		if (event.keyCode == Keyboard.RIGHT)
		{
			speedX = 1;
		}
		
		if (event.keyCode == Keyboard.LEFT)
		{
			speedX = -1;
		}
		
		if (event.keyCode == Keyboard.UP)
		{
			speedY = -1;
		}
		
		if (event.keyCode == Keyboard.DOWN)
		{
			speedY = 1;
		}
	}
	*/
	
	public function move(event:Event) : Void
	{
		this.x += speedX;
		this.y += speedY;
	}
	
	/* Getter and setter functions for speed, used in Game class*/
	public function set_speedX(number : Float) : Void
	{
		speedX = number;
	}
	
	public function set_speedY(number : Float) : Void
	{
		speedY = number;
	}
	
	public function get_speedX() : Float
	{
		return speedX;
	}
	
	public function get_speedY() : Float
	{
		return speedY;
	}
	
}