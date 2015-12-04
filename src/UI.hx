package ;
import flash.display.DisplayObjectContainer;
import flash.display.Sprite;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.text.TextFormatAlign;
import flash.text.TextFieldAutoSize;
import openfl.Assets;

/**
 *
 * UI.hx: Class used for declaring and creating graphical interfaces such as Start and Game Over menus
 */

class UI extends Sprite
{
	private var screen_select : String = "";
	private var refGame : Game;
	var fontAsset = Assets.getFont("assets/PressStart2P.ttf").fontName;
	
	public function new(gui_container : DisplayObjectContainer, select_screen : String, enter_refGame : Game) 
	{
		
		super();
		refGame = enter_refGame;
		gui_container.addChild(this);
		screen_select = select_screen;
		
		 switch( screen_select ) 
		 {
			case "Start":
			create_Start();
			
			case "GameOver":
			create_GameOver();
				 
			default:
			trace( "No screen selected" );
		} 		
		
	}
	
	function create_Start() : Void
	{
		var mainTitleFormat = new TextFormat(fontAsset);
		mainTitleFormat.size = 75;
		
		var directionFormat = new TextFormat(fontAsset);
		directionFormat.size = 25;
		
		var mainTitle : TextField = new TextField();
		mainTitle.defaultTextFormat = mainTitleFormat;
		mainTitle.embedFonts = true;
		mainTitle.text = "Avoider";
		mainTitle.width = 250;
		mainTitle.textColor = 0xFFFFFF;
		mainTitle.autoSize = TextFieldAutoSize.CENTER;
		mainTitle.y = (stage.stageHeight / 3) - (mainTitle.height / 2);
		mainTitle.x = (stage.stageWidth / 2) - (mainTitle.width / 2);
		addChild(mainTitle);
		
		var directionTitle : TextField = new TextField();
		directionTitle.defaultTextFormat = directionFormat;
		directionTitle.embedFonts = true;
		directionTitle.text = "Use arrow keys to avoid stuff!";
		directionTitle.width = 250;
		directionTitle.textColor = 0xFFFFFF;
		directionTitle.autoSize = TextFieldAutoSize.CENTER;
		directionTitle.y = (stage.stageHeight / 1.5) - (directionTitle.height / 2);
		directionTitle.x = (stage.stageWidth / 2) - (directionTitle.width / 2);
		addChild(directionTitle);
		
		var directionTitle2 : TextField = new TextField();
		directionTitle2.defaultTextFormat = directionFormat;
		directionTitle2.embedFonts = true;
		directionTitle2.text = "Press Enter Key to begin";
		directionTitle2.width = 250;
		directionTitle2.textColor = 0xFFFFFF;
		directionTitle2.autoSize = TextFieldAutoSize.CENTER;
		directionTitle2.y = (stage.stageHeight / 1.7) - (directionTitle.height / 2);
		directionTitle2.x = (stage.stageWidth / 1.3) - (directionTitle.width / 2);
		addChild(directionTitle2);
		
		var name : TextField = new TextField();
		name.defaultTextFormat = directionFormat;
		name.embedFonts = true;
		name.text = "©Romney Doria 2015";
		name.width = 250;
		name.textColor = 0xFFFFFF;
		name.autoSize = TextFieldAutoSize.CENTER;
		name.y = (stage.stageHeight / 1.2) - (name.height / 2);
		name.x = (stage.stageWidth / 2) - (name.width / 2);
		addChild(name);
		
		var version : TextField = new TextField();
		version.defaultTextFormat = directionFormat;
		version.embedFonts = true;
		version.text = "Version 1.2";
		version.width = 250;
		version.textColor = 0xFFFFFF;
		version.autoSize = TextFieldAutoSize.CENTER;
		version.y = (stage.stageHeight / 1.1) - (version.height / 2);
		version.x = (stage.stageWidth / 2) - (version.width / 2);
		addChild(version);
	}
	
	function create_GameOver() : Void
	{
		var gameOverSprite : Sprite = new Sprite();
		gameOverSprite.graphics.beginFill(0x000000);
		gameOverSprite.graphics.drawRect(0, 0, stage.stageWidth, stage.stageHeight);
		gameOverSprite.graphics.endFill();
		addChild(gameOverSprite);
			
		var gameOverTF = new TextFormat(fontAsset);
		gameOverTF.size = 45;
		
		var gameOverTF2 = new TextFormat(fontAsset);
		gameOverTF2.size = 25;
		
		var gameOverText : TextField = new TextField();
		gameOverText.defaultTextFormat = gameOverTF2;
		gameOverText.embedFonts = true;
		gameOverText.text = "Final Score: " + refGame.score.getScore();
		gameOverText.width = 200;
		gameOverText.height = 25;
		gameOverText.textColor = 0xFFFFFF;
		gameOverText.x = (stage.stageWidth / 2.0) - (gameOverText.width / 2);
		gameOverText.y = (stage.stageHeight / 2) - (gameOverText.height / 2);
		gameOverText.autoSize = TextFieldAutoSize.CENTER;
		addChild(gameOverText);
		
		var gameOverText2 : TextField = new TextField();
		gameOverText2.defaultTextFormat = gameOverTF2;
		gameOverText2.embedFonts = true;
		gameOverText2.text = "Press Enter Key to play again!";
		gameOverText2.width = 200;
		gameOverText2.height = 25;
		gameOverText2.textColor = 0xFFFFFF;
		gameOverText2.x = (stage.stageWidth / 1.7) - (gameOverText.width / 2);
		gameOverText2.y = (stage.stageHeight / 1.7) - (gameOverText.height / 2);
		gameOverText2.autoSize = TextFieldAutoSize.CENTER;
		addChild(gameOverText2);
		
		var gameOverText3 : TextField = new TextField();
		gameOverText3.defaultTextFormat = gameOverTF;
		gameOverText3.embedFonts = true;
		gameOverText3.text = "Game Over";
		gameOverText3.width = 200;
		gameOverText3.height = 25;
		gameOverText3.textColor = 0xFFFFFF;
		gameOverText3.x = (stage.stageWidth / 2.0) - (gameOverText3.width / 2);
		gameOverText3.y = (stage.stageHeight / 2.5) - (gameOverText3.height / 2);
		gameOverText3.autoSize = TextFieldAutoSize.CENTER;
		addChild(gameOverText3);
		
	}
		
	
}