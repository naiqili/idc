 package  {

    import flash.display.Sprite;
    import flash.text.TextField;
	import fl.controls.Button;
	import fl.controls.Label;
 
    public class MsgBox extends Sprite {
		
		public var msgbox:Sprite;
    
        function MsgBox(x, y):void {

          msgbox = new Sprite();

          // drawing a white rectangle
          msgbox.graphics.beginFill(0x3399FF); // white
          msgbox.graphics.drawRect(x,y,300,60); // x, y, width, height
          msgbox.graphics.endFill();
 
          // drawing a black border
          msgbox.graphics.lineStyle(2, 0x000000, 0);  // line thickness, line color (black), line alpha or opacity
          msgbox.graphics.drawRect(0,0,300,20); // x, y, width, height
        
          var _label:Label = new Label();
          _label.text = "Hi there!";
		  _label.width = 290;
		  
		  var _btn_yes:Button = new Button();
		  _btn_yes.label = "YES";
		  var _btn_no:Button = new Button();
		  _btn_no.label = "NO";

          msgbox.addChild(_label);
		  msgbox.addChild(_btn_yes);
		  msgbox.addChild(_btn_no);
		  _label.x = x+5;
		  _label.y = y+5;
		  _btn_yes.x = x+5;
		  _btn_yes.y = y+30;
		  _btn_no.x = x+195;
		  _btn_no.y = y+30;  
		  addChild(msgbox);
        }
     }
  }