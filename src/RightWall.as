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
	public class RightWall extends Entity
	{
		[Embed(source = "rightWall.png")]
		private const RIGHTW:Class;
		private var right_wall:Image;
		public function RightWall(px:Number=0,py:Number=0) 
		{
			right_wall = new Image(RIGHTW);
			super(px, py, right_wall);
			mask = new Pixelmask(RIGHTW);
			type = "RightWall";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				tempPlayer.x = this.x - tempPlayer.width;
				FP.world.camera.x -= 300 * FP.elapsed;
			}
			super.update();
		}
	}
}