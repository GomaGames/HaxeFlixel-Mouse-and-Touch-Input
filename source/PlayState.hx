package;

import flixel.FlxG;
import flixel.FlxState;
import sprites.Square;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState extends FlxState
{
  private var rectangle_1 : Square;
  private var rectangle_2 : Square;

  /**
   * Function that is called up when to state is created to set it up.
   */
  override public function create():Void
  {
    // create the two shapes to be added to this state
    rectangle_1 = new Square();
    rectangle_2 = new Square();

    // set shape positions
    rectangle_1.setPosition( ( FlxG.width - rectangle_1.width ) * .3, ( FlxG.height - rectangle_1.height ) / 2);
    rectangle_2.setPosition( ( FlxG.width - rectangle_2.width ) * .7, ( FlxG.height - rectangle_2.height ) / 2);

    // add the shapes to this state
    add(rectangle_1);
    add(rectangle_2);

    // call the superclass create() method *required*
    super.create();
  }

  /**
   * Function that is called when this state is destroyed - you might want to
   * consider setting all objects this state uses to null to help garbage collection.
   */
  override public function destroy():Void
  {
    // set sprites to null to help with gc
    rectangle_1 = null;
    rectangle_2 = null;

    super.destroy();
  }

  /**
   * Function that is called once every frame.
   */
  override public function update():Void
  {
    super.update();
  }

}
