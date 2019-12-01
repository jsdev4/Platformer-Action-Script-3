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
	public class LargePlatform extends Entity
	{
		[Embed(source = "large_platform.png")]
		private const LRGPLT:Class;
		private var LargePlat:Image;
		public function LargePlatform(px:Number=0,py:Number=0) 
		{
			LargePlat = new Image(LRGPLT);
			super(px, py, LargePlat);
			mask = new Pixelmask(LRGPLT);
			type = "LargePlatform";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;	
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y+148)
				{
					tempPlayer.y = this.y - tempPlayer.height ;
					tempPlayer.set_on_ground();	
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-135)
				{
					tempPlayer.y = this.y - tempPlayer.height ;
					tempPlayer.set_on_ground();	
				}
			}
			super.update();
		}
	}
}