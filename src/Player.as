package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Sfx;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Juan
	 */
	public class Player extends Entity
	{
		[Embed(source = "Fotstep_Carpet_Left_2.mp3")]
		private const FOOTSTP:Class;
		private var footstep:Sfx;
		[Embed(source = "player_sprite.png")]
		private const PLAYER:Class;
		private var player:Image;
		[Embed(source = "player_spritesheets.png")]
		private const PLAYER_AIM:Class;
		private var player_anim:Spritemap;
		private var gravity:Number;
		private var offset_cam:Number;
		private var flipped_cam:Boolean;
		private var key_pressed:Boolean;
		private var no_move_cam:Boolean;
		private var is_jumping:Boolean;
		private var on_ground:Boolean;
		private var can_move:Boolean;
		private var is_killed:Boolean;
		private var friendly_status:int;
		private var has_finished:Boolean;
		public function Player(px:Number=0,py:Number=0) 
		{
			footstep = new Sfx(FOOTSTP);
			offset_cam = 50;
			gravity = 98.1;
			can_move = true;
			is_killed = false;
			player_anim = new Spritemap(PLAYER_AIM, 50, 50);
			player_anim.add("idle", [0, 1, 2, 3, 4], 10, true);
			player_anim.add("running", [5, 6, 7, 8], 10, true);
			player_anim.add("jumping", [10, 11, 12, 13], 10, false);
			player_anim.add("touching", [20, 21, 22], 10, false);
			player_anim.add("death", [25, 26, 27], 10, false);
			player_anim.play("idle");
			super(px, py, player_anim);
			mask = new Pixelmask(PLAYER);
			type = "Player";
			flipped_cam = false;
			key_pressed = false;
			no_move_cam = false;
			friendly_status = 0;
			has_finished = false;
		}
		override public function update():void
		{
			y += gravity * FP.elapsed;
			var gWorldB:GameWorld = FP.world as GameWorld;
			if (gWorldB.get_game_started() == true&&can_move==true)
			{
				if (Input.check(Key.LEFT))
				{
					player_anim.flipped = true;
					x -= 200 * FP.elapsed;
					player_anim.play("running");
					flipped_cam = false;
					key_pressed = true;
				}
				if (Input.check(Key.RIGHT))
				{
					player_anim.flipped = false;
					x += 200 * FP.elapsed;
					player_anim.play("running");
					flipped_cam = true;
					key_pressed = true;
				}
				if (Input.check(Key.SPACE)&&on_ground==true)
				{
					is_jumping = true;
				}
				if (flipped_cam == false&&key_pressed==true)
				{
					FP.camera.x -= 150 * FP.elapsed;
				}
				if (flipped_cam == true&&key_pressed==true)
				{
					FP.camera.x += 150 * FP.elapsed;
				}
				if (Input.pressed(Key.RIGHT) || Input.pressed(Key.LEFT))
				{
					footstep.loop(1, 0);
				}
				if (Input.released(Key.LEFT) || Input.released(Key.RIGHT))
				{
					player_anim.play("idle");
					key_pressed = false;
					footstep.stop();
				}
				if (is_jumping == true)
				{
					y -= 1600 * FP.elapsed;
					player_anim.play("jumping");
					is_jumping = false;
					on_ground = false;
				}
			}
			if (can_move == false)
			{
				if (player_anim.currentAnim == "death" && player_anim.complete)
				{
					var gWorldP:GameWorld = FP.world as GameWorld;
					is_killed = true;
				}
			}
			super.update();
		}
		public function set_on_ground():void
		{
			on_ground = true;
		}
		public function inverted_gravity():void
		{
			gravity = 0;
		}
		public function return_gravity():void
		{
			gravity = 98.1;
		}
		public function kill_player():void
		{
			footstep.stop();
			player_anim.play("death");
			can_move = false;
		}
		public function get_if_is_killed():Boolean
		{
			return is_killed;
		}
		public function is_touching():void
		{
			player_anim.play("touching");
		}
		public function has_put_all_sound():void
		{
			footstep.stop();
			can_move = false;
			player_anim.play("touching");
			has_finished = true;
		}
		public function return_if_finished():Boolean
		{
			return has_finished;
		}
	}
}