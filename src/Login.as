 package  {

    import flash.display.Sprite;
    import flash.text.TextField;
	import fl.controls.Button;
	import fl.controls.Label;
	import fl.controls.TextInput;
	import flash.text.TextFieldType;
 
    public class Login extends Sprite {
		
		public var msgbox:Sprite;
		public var textbox:TextField = new TextField();
		public var btn_yes:Button = new Button();
    
        function Login(x, y, curEmail):void {

          msgbox = new Sprite();

          // drawing a white rectangle
          msgbox.graphics.beginFill(0x3399FF); // white
          msgbox.graphics.drawRect(x,y,300,60); // x, y, width, height
          msgbox.graphics.endFill();
 
          // drawing a black border
          msgbox.graphics.lineStyle(2, 0x000000, 0);  // line thickness, line color (black), line alpha or opacity
          msgbox.graphics.drawRect(0,0,300,20); // x, y, width, height
        
          textbox.text = curEmail;
		  textbox.width = 290;
		  textbox.selectable = true;
		  textbox.type = TextFieldType.INPUT;
		  
		  btn_yes.label = "OK";
		  
          msgbox.addChild(textbox);
		  msgbox.addChild(btn_yes);
		  textbox.x = x+5;
		  textbox.y = y+5;
		  btn_yes.x = x+100;
		  btn_yes.y = y+30;
		  addChild(msgbox);
        }
     }
  }