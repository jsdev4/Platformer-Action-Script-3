package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Emitter;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Input;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.Tween;
	import net.flashpunk.utils.Ease;
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author Juan
	 */
	public class Enemy extends Entity
	{
		[Embed(source = "enemy_sprite.png")]
		private const ENEMY:Class;
		[Embed(source = "enemy_spritesheet.png")]
		private const ENEMY_ANIM:Class;
		private var enemy_anim:Spritemap;
		private var enemy_status:int;
		private var type_enemy_for_ground:int;
		private var playerGraphiclist:Graphiclist;
		private var explosionEmitter:Emitter;
		private var emitting:int;
		public function Enemy(px:Number=0,py:Number=0,typeE:int=0) 
		{
			explosionEmitter = new Emitter(new BitmapData(12,12),12,12);
			explosionEmitter.newType("explode",[0]);
			explosionEmitter.setAlpha("explode",0.4,0);
			explosionEmitter.setMotion("explode", 0, 80, 1, 180, -50, -0.5, Ease.backOut);
			explosionEmitter.relative = true;				
			emitting = 0;
			type_enemy_for_ground = typeE;
			enemy_status =0;
			enemy_anim = new Spritemap(ENEMY_ANIM, 15,15);
			enemy_anim.add("badguy", [0, 1, 2, 3, 4], 10, true);
			enemy_anim.add("goodguy", [5, 6, 7, 8, 9], 10, true);
			playerGraphiclist = new Graphiclist(enemy_anim, explosionEmitter);
			super(px, py, playerGraphiclist);
			mask = new Pixelmask(ENEMY);
			type = "Enemy";
			enemy_anim.flipped = false;
		}
		override public function update():void
		{
			var gWorldB:GameWorld = FP.world as GameWorld;
			if (gWorldB.get_friendly_enemy() == 1||gWorldB.get_friendly_enemy() == 1.5)
			{
				
				enemy_status = 1;
			}
			if (gWorldB.get_friendly_enemy() == 2||gWorldB.get_friendly_enemy() == 2.5)
			{
				enemy_status =2;
			}
			if (gWorldB.get_friendly_enemy() == 3||gWorldB.get_friendly_enemy() == 3.5)
			{
				enemy_status =3;
			}
			if (gWorldB.get_friendly_enemy() == 4||gWorldB.get_friendly_enemy() == 4.5)
			{
				enemy_status = 4;
			}
			if (gWorldB.get_game_started() == true)
			{
				if (type_enemy_for_ground == 0)
				{
					enemy_anim.play("badguy");
					if (enemy_anim.flipped==false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 630)
						{
							enemy_anim.flipped = false;
						}
					}
				}
				if (type_enemy_for_ground == 1)
				{
					enemy_anim.play("badguy");
					if (enemy_anim.flipped==false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 470)
						{
							enemy_anim.flipped = false;
						}
					}
				}
				if (type_enemy_for_ground == 2)
				{
					enemy_anim.play("badguy");
					if (enemy_anim.flipped == false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 520)
						{	
							enemy_anim.flipped = false;
						}
					}
				}
				if (enemy_status == 0)
				{
					if (type_enemy_for_ground == 3)
					{
						enemy_anim.play("badguy");
					}
					if (type_enemy_for_ground ==4)
					{
						enemy_anim.play("badguy");
					}
					if (type_enemy_for_ground ==5)
					{
						enemy_anim.play("badguy");
					}
					if (type_enemy_for_ground ==6)
					{
						enemy_anim.play("badguy");
					}
				}
				if (enemy_status == 1)
				{
					if (type_enemy_for_ground == 3)
					{
						enemy_anim.play("goodguy");
						emitting += 1;
					}							
				}
				if (enemy_status == 2)
				{
					if (type_enemy_for_ground == 4 )
					{
						enemy_anim.play("goodguy");
						emitting += 1;
					}	
				}
				if (enemy_status == 3)
				{
					if (type_enemy_for_ground == 5 )
					{
						enemy_anim.play("goodguy");
						emitting += 1;
					}	
				}
				if (enemy_status == 4)
				{
					if (type_enemy_for_ground == 6 )
					{
						enemy_anim.play("goodguy");
						emitting += 1;
					}	
				}
				if (type_enemy_for_ground == 3)
				{
					if (enemy_anim.flipped==false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 630)
						{
							enemy_anim.flipped = false;
						}
					}
				}
				if (type_enemy_for_ground == 4)
				{
					if (enemy_anim.flipped==false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 630)
						{
							enemy_anim.flipped = false;
						}
					}
				}
				if (type_enemy_for_ground == 5)
				{
					if (enemy_anim.flipped==false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 630)
						{
							enemy_anim.flipped = false;
						}
					}
				}
				if (type_enemy_for_ground == 6)
				{
					if (enemy_anim.flipped==false)
					{
						x -= 50 * FP.elapsed;
						if (this.x <= FP.screen.x + 10)
						{	
							enemy_anim.flipped = true;
						}
					}
					if (enemy_anim.flipped == true)
					{
						x += 50 * FP.elapsed;
						if (this.x >= FP.screen.x + 630)
						{
							enemy_anim.flipped = false;
						}
					}
				}
			}
			if (emitting == 1)
			{
				explosionEmitter.setColor("explode", 0x8eaeca, 0xba5b61);
				for (var i:uint = 0; i < 50; i++)
				explosionEmitter.emit("explode", enemy_anim.x +enemy_anim.width / 2, enemy_anim.y + enemy_anim.height / 2);	
			}		
			var collidable:Entity = this.collide("Player", this.x, this.y);
			if (collidable)
			{
				var tempPlayer:Player = collidable as Player;
				if (enemy_status == 0)
				{
					tempPlayer.kill_player();
				}
				if (enemy_status == 1 && type_enemy_for_ground == 4)
				{
					tempPlayer.kill_player();
				}
				if (enemy_status == 1 && type_enemy_for_ground == 5||enemy_status == 2 && type_enemy_for_ground == 5)
				{
					tempPlayer.kill_player();
				}
				if (enemy_status == 1 && type_enemy_for_ground == 6||enemy_status == 2 && type_enemy_for_ground == 6)
				{
					tempPlayer.kill_player();
				}
				if (enemy_status == 3 && type_enemy_for_ground == 6)
				{
					tempPlayer.kill_player();
				}
			}
			super.update();
		}
	}
}