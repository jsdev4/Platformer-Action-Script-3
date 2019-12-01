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
	public class LeftWall extends Entity
	{
		[Embed(source = "leftWall.png")]
		private const LEFTW:Class;
		private var left_wall:Image;
		public function LeftWall(px:Number=0,py:Number=0) 
		{
			left_wall = new Image(LEFTW);
			super(px, py, left_wall);
			mask = new Pixelmask(LEFTW);
			type = "LeftWall";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				tempPlayer.x = this.x + this.width;
			    FP.camera.x += 300 * FP.elapsed;
			}
			super.update();
		}	
	}
}