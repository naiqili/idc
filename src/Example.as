 package  {

    import flash.display.Sprite;
    import flash.text.TextField;
	import fl.controls.Button;
	import fl.controls.Label;
	import fl.controls.TextInput;
	import flash.text.TextFieldType;
	import fl.controls.TextArea;
 
    public class Example extends Sprite {
		
		public var msgbox:Sprite;
		public var textbox:TextArea = new TextArea();
		public var btn_yes:Button = new Button();
    
        function Example(x, y, ww, hh, txt):void {

          msgbox = new Sprite();

          // drawing a white rectangle
          msgbox.graphics.beginFill(0x3399FF); // white
		  msgbox.graphics.lineStyle(3, 0x3333FF);
          msgbox.graphics.drawRect(x,y,ww,hh); // x, y, width, height
          msgbox.graphics.endFill();
 
          // drawing a black border
          msgbox.graphics.lineStyle(2, 0x000000, 0);  // line thickness, line color (black), line alpha or opacity
          msgbox.graphics.drawRect(0,0,300,20); // x, y, width, height
        
          textbox.text = txt;
		  textbox.width = ww-10;
		  textbox.height = hh-40;
		  textbox.editable = false;
		  
		  btn_yes.label = "OK";
		  
          msgbox.addChild(textbox);
		  msgbox.addChild(btn_yes);
		  textbox.x = x+5;
		  textbox.y = y+5;
		  btn_yes.x = x+ww/2-40;
		  btn_yes.y = y+hh-30;
		  addChild(msgbox);
        }
     }
  }