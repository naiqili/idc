 package  {

    import flash.display.Sprite;
    import flash.text.TextField;
	import fl.controls.Button;
	import fl.controls.Label;
	import fl.controls.TextInput;
	import flash.text.TextFieldType;
 
    public class Thankyou extends Sprite {
		
		public var msgbox:Sprite;
		public var textbox:TextField = new TextField();
		public var btn_yes:Button = new Button();
		public var txt_cnt:String = "";
    
        function Thankyou(x, y):void {

          msgbox = new Sprite();

          // drawing a white rectangle
          msgbox.graphics.beginFill(0x3399FF); // white
		  msgbox.graphics.lineStyle(3, 0x3333FF);
          msgbox.graphics.drawRect(x,y,320,60); // x, y, width, height
          msgbox.graphics.endFill();

        
          textbox.text = "Thank you! You totally help us with " + txt_cnt + " dialogs!";
		  textbox.width = 310;
		  textbox.selectable = false;
		  
		  btn_yes.label = "OK";
		  
          msgbox.addChild(textbox);
		  msgbox.addChild(btn_yes);
		  textbox.x = x+15;
		  textbox.y = y+5;
		  btn_yes.x = x+110;
		  btn_yes.y = y+30;
		  addChild(msgbox);
        }
     }
  }