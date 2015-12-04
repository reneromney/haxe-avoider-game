package ;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;

/**
 * ...
 * @author Romney
 */
class TouchControls extends Sprite
{

	public function new(gui_container : DisplayObjectContainer) 
	{
		super();
		gui_container.addChild(this);
		this.create_display_list();
	}
	
	private function create_display_list() : Void
	{
		var upButton : Sprite = new Sprite();
		upButton.graphics.beginFill(0xFFFFFF);
		upButton.graphics.drawRect(20, stage.stageHeight, 20, 50);
		upButton.graphics.endFill();
		addChild(upButton);
		
	}
	
}