package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Juan
	 */
	public class Dbox extends Entity
	{
		[Embed(source = "double_box.png")]
		private const DBOX:Class;
		private var dbox:Image;
		private var on_box:Boolean;
		private var gravity:Number;
		public function Dbox(px:Number=0,py:Number=0) 
		{
			dbox = new Image(DBOX);
			super(px, py, dbox);
			mask = new Pixelmask(DBOX);
			type = "Dbox";
			gravity = 98.1;
			on_box = false;
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
					
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y+170)
				{
					if (tempPlayer.x + tempPlayer.width >= 572)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y+108)//box ground01
				{
					if (tempPlayer.x <= 98)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-169)
				{
					if (tempPlayer.x<=190&&tempPlayer.x+tempPlayer.width>=102)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-302) //box ground02
				{
					if (tempPlayer.x<=560&&tempPlayer.x+tempPlayer.width>=465)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}	
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-546) //box ground03
				{
					if (tempPlayer.x<=190&&tempPlayer.x+tempPlayer.width>=120)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}	
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-752) //box ground03
				{
					if (tempPlayer.x <=300&&tempPlayer.x+tempPlayer.width>=230)
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