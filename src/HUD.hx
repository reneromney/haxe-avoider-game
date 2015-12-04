package ;
import flash.display.DisplayObjectContainer;
import flash.events.Event;
import flash.text.TextField;
import flash.utils.Timer;
import flash.events.TimerEvent;
import flash.display.Sprite;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextFieldAutoSize;
import openfl.Assets;

/**
 *
 * Score.hx: Class used for in Game overlay elements such as score, timer settings
 */
class HUD extends Sprite
{
	var fontAsset = Assets.getFont("assets/PressStart2P.ttf").fontName;
	public var playerScore : Int = 0;
	
	public var tfStyle    : TextFormat;
	public var scoreTitle : TextField;
	var scoreTimer : Timer;
	
	public function new(gui_container : DisplayObjectContainer) 
	{
	super();
	gui_container.addChild(this);
	
	var tfStyle : TextFormat = new TextFormat(fontAsset);
		tfStyle.size = 20;
		
		var scoreTitle = new TextField();
		scoreTitle.defaultTextFormat = tfStyle;
		scoreTitle.embedFonts = true;
		scoreTitle.text = "Score: " + Std.string(playerScore);
		scoreTitle.width = 100;
		scoreTitle.textColor = 0x000000;
		scoreTitle.autoSize = TextFieldAutoSize.CENTER;
		scoreTitle.y = (stage.stageHeight / 2) - (scoreTitle.height / 2);
		scoreTitle.x = (stage.stageWidth / 2) - (scoreTitle.width / 2);
		
		addChild(scoreTitle); 	
	/*
	scoreTitle = new TextField();
	scoreTitle.text = "Hello world";
	
	tfStyle = new TextFormat();
	scoreTitle.embedFonts = true;
	scoreTitle.textColor = 0xFFFFFF;
	tfStyle.size = 16;
	tfStyle.color = 0x1C334A;
	tfStyle.font = "Press Start 2p";
	tfStyle.leftMargin = 3;
	tfStyle.rightMargin = 3;
	scoreTitle.setTextFormat(tfStyle);
	*/

	scoreTimer = new Timer(1000);
	scoreTimer.addEventListener(TimerEvent.TIMER, addPoint);
	scoreTimer.start();
	
	}
	/* Note to self on refreshing and updating information on a HUD.
	 * 1. Remove all elements related to that object with 
	 * while (numChildren > 0)
	 * {
	 *    removeChildAt(0);
	 * }
	 * 
	 * 2. Generate TextFormat and assign it.
	 * 3. Generate Textfield
	 * Need to have both the TextFormat and TextField declared in both the constructor and the 
	 * event listener in order to refresh display as seconds/time/points/etc... are updated. 
	 * */
	function addPoint(event:TimerEvent) : Void 
	{
		while (numChildren > 0) 
		{
			removeChildAt(0);
		}
		
		playerScore += 1;
		
		var tfStyle : TextFormat = new TextFormat(fontAsset);
		tfStyle.size = 20;
		
		var scoreTitle = new TextField();
		scoreTitle.defaultTextFormat = tfStyle;
		scoreTitle.embedFonts = true;
		scoreTitle.text = "Score: " + Std.string(playerScore);
		scoreTitle.width = 100;
		scoreTitle.textColor = 0x000000;
		scoreTitle.autoSize = TextFieldAutoSize.CENTER;
		scoreTitle.y = (stage.stageHeight / 2) - (scoreTitle.height / 2);
		scoreTitle.x = (stage.stageWidth / 2) - (scoreTitle.width / 2);
		
		addChild(scoreTitle); 
	}
	
	public function stopTimer() : Void
	{
		scoreTimer.stop();
	}
	
	public function getScore() : Int
	{
		return playerScore;
	}
}