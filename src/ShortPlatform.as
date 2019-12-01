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
	public class ShortPlatform extends Entity
	{
		[Embed(source = "short_platform.png")]
		private const SHORTP:Class;
		private var shortPlat:Image;
		public function ShortPlatform(px:Number=0,py:Number=0) 
		{
			shortPlat = new Image(SHORTP);
			super(px, py, shortPlat);
			mask = new Pixelmask(SHORTP);
			type = "ShortPlatform";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y+35)
				{
					tempPlayer.y = this.y - tempPlayer.height ;
					tempPlayer.set_on_ground();	
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-430&&tempPlayer.y+tempPlayer.height<=FP.screen.y>=440) //box ground02
				{
					if (tempPlayer.x<=520&&tempPlayer.x+tempPlayer.width>=420)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}	
				}
			}
			super.update();
		}
	}
}