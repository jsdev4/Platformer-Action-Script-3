package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Juan
	 */
	public class Computer extends Entity
	{
		[Embed(source = "laptop_sprite.png")]
		private const LAPTOP:Class;
		[Embed(source = "laptop_spritesheet.png")]
		private const LAPTOP_ANIM:Class;
		private var laptop_anim:Spritemap;
		private var level:int;
		private var put_sound:Boolean;
		public function Computer(px:Number=0,py:Number=0,pcNo:int=0) 
		{
			level =pcNo;
			put_sound = false;
			laptop_anim = new Spritemap(LAPTOP_ANIM,39,61);
			laptop_anim.add("nope", [0, 1, 2, 3, 4], 10, true);
			laptop_anim.add("sound_on", [5, 6, 7, 8, 9], 10, true);
			super(px, py, laptop_anim);
			mask = new Pixelmask(LAPTOP);
			type = "Computer";
			laptop_anim.play("nope");
		}
		override public function update():void
		{
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				var gWorldF:GameWorld = FP.world as GameWorld;
				if (Input.check(Key.ENTER))
				{
					put_sound = true;
					tempPlayer.is_touching();
					if (level == 2)
					{
						gWorldF.set_friendly_enemy(1);
					}
					if (level == 3)
					{
						gWorldF.set_friendly_enemy(2);
					}
					if (level == 4)
					{	
						gWorldF.set_friendly_enemy(3);
					}
					if (level == 5)
					{	
						gWorldF.set_friendly_enemy(4);
						tempPlayer.has_put_all_sound();
					}
				}
			}
			if (put_sound==true)
			{
				laptop_anim.play("sound_on");
			}
			super.update();
		}
		public function get_the_level():int
		{
			return level;
		}
	}
}