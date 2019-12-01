package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Juan
	 */
	public class TiltedPlatform extends Entity
	{
		[Embed(source = "tilted_platform.png")]
		private const TILT:Class;
		private var tilted:Image;
		public function TiltedPlatform(px:Number=0,py:Number=0) 
		{
			tilted = new Image(TILT);
			super(px, py, tilted);
			mask = new Pixelmask(TILT);
			type = "TiltedPlatform";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				tempPlayer.y -= 198.1 * FP.elapsed;
				tempPlayer.set_on_ground();		
			}
			super.update();
		}		
	}
}