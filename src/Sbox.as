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
	public class Sbox extends Entity
	{
		[Embed(source = "simple_box.png")]
		private const SBOX:Class;
		private var sbox:Image;
		public function Sbox(px:Number=0,py:Number=0) 
		{
			sbox = new Image(SBOX);
			super(px, py, sbox);
			mask = new Pixelmask(SBOX);
			type = "Sbox";
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y+74)
				{	
					if (tempPlayer.x <= 80&&tempPlayer.x + tempPlayer.width>=0)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-202)
				{
					if (tempPlayer.x + tempPlayer.width >=122&&tempPlayer.x<=160)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-337)//box ground02
				{
					if (tempPlayer.x + tempPlayer.width >=500&&tempPlayer.x<=560)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-545)//box ground03
				{
					if (tempPlayer.x + tempPlayer.width >=120&&tempPlayer.x<=160)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-784)//box ground04
				{
					if (tempPlayer.x<=270&&tempPlayer.x + tempPlayer.width>=230)
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