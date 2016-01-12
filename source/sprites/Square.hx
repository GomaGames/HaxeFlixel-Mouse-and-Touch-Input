package sprites;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
using flixel.util.FlxSpriteUtil;

class Square extends FlxSprite{

  private static inline var rectangle_size : Float = 150;
  private static inline var rectangle_corner_radius : Float = 10;

  public var hovering : Bool;
  public var pressed : Bool;

  public function new()
  {
    // must call super constructor before making graphic
    super();

    // use chaining to setup the shape graphics
    this.makeGraphic( rectangle_size, rectangle_size, FlxColor.TRANSPARENT )
        .drawRoundRect( 0, 0, rectangle_size, rectangle_size, rectangle_corner_radius, rectangle_corner_radius, FlxColor.WHITE, null, null, null);
  }

  override public function update():Void
  {
    super.update();

    handleInput();

    handleAnimations();

  }

  override public function destroy():Void
  {
    super.destroy();
  }

  private inline function handleInput():Void
  {
    // touch events
    for(touch in FlxG.touches.list){
      pressed = pressed || touch.overlaps(this);
    }

    // mouse events
    hovering = this.overlapsPoint(FlxG.mouse.getScreenPosition());
    pressed = hovering && FlxG.mouse.pressed;
  }

  private inline function handleAnimations():Void
  {
    if(pressed){
      this.set_color(FlxColor.HOT_PINK);
    } else if(hovering){
      this.set_color(FlxColor.CHARTREUSE);
    } else {
      this.set_color(FlxColor.FOREST_GREEN);
    }
  }
}
