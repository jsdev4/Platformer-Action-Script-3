package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Juan
	 */
	public class Server extends Entity
	{
		[Embed(source = "server_sprite.png")]
		private const SV:Class;
		[Embed(source = "server_spritesheet.png")]
		private const SV_ANIM:Class;
		private var sv_anim:Spritemap;
		public function Server(px:Number=0,py:Number=0) 
		{
			sv_anim = new Spritemap(SV_ANIM, 103, 105);
			sv_anim.add("idle",[0, 1, 2],10,true);
			super(px, py, sv_anim);
			mask = new Pixelmask(SV_ANIM);
			type = "Server";
		}
		override public function update():void
		{
			sv_anim.play("idle");
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-373&&tempPlayer.y+tempPlayer.height>=FP.screen.y-390)//server ground02
				{
					if (tempPlayer.x + tempPlayer.width<=640&&tempPlayer.x+tempPlayer.width>=537)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}	
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-610)//server ground03
				{
					if (tempPlayer.x + tempPlayer.width<=140&&tempPlayer.x+tempPlayer.width>=23)
					{
						tempPlayer.y = this.y - tempPlayer.height ;
						tempPlayer.set_on_ground();	
					}	
				}
				if (tempPlayer.y+tempPlayer.height<=FP.screen.y-820)//server ground04
				{
					if (tempPlayer.x<=400&&tempPlayer.x+tempPlayer.width>=290)
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