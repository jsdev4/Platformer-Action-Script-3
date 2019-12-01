package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Juan
	 */
	public class GroundStreet extends Entity
	{
		[Embed(source = "ground_street.png")]
		private const GROUNDS:Class;
		private var ground_s:Image;
		public function GroundStreet(px:Number=0,py:Number=0) 
		{
			ground_s = new Image(GROUNDS);
			super(px, py, ground_s);
			mask = new Pixelmask(GROUNDS);
			type = "GroundStreet";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y)
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				tempPlayer.y = this.y - tempPlayer.height;
				tempPlayer.set_on_ground();
			}
			super.update();
		}
	}
}