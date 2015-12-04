package ;


import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

/**
 * Enemy.hx: Class used for declaring enemy type
 */
class Enemy extends Sprite 
{
	public var color: UInt;
	private var speedX : Int = 0;
	private var speedY : Int = 0;
	
	
	public function new(gui_container : DisplayObjectContainer) 
	{
		super();
		//gui_container.addChild(this);
		gui_container.addChildAt(this, 0);
		color = Math.round(Math.random() * 0xFFFFFF);
		this.create_display_list();
		this.addEventListener(Event.ENTER_FRAME, move);
	}
	
	private function create_display_list() : Void
	{
		var size : Int = 75;
		this.graphics.beginFill(color);
		this.graphics.drawRect(0, 0, size, size);
		this.graphics.endFill();
	}
	
	public function set_direction(set_SpeedX : Int, set_SpeedY : Int) : Void
	{
		speedX += set_SpeedX;
		speedY += set_SpeedY;
	}
	
	public function move(event:Event) : Void
	{
		this.x += speedX;
		this.y += speedY;
	}
	
}