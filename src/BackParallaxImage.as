package 
{
		import net.flashpunk.utils.Input;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Juan
	 */
	public class BackParallaxImage extends Entity
	{
		[Embed(source = "parallax_background.png")]
		private const PRLLX:Class;
		private var parallax:Image;
		private var can_move:Boolean;
		public function BackParallaxImage(px:Number=0,py:Number=0) 
		{
			parallax = new Image(PRLLX);
			super(px, py, parallax);
			can_move = true;
		}
		override public function update():void
		{
			var gWroldP:GameWorld = FP.world as GameWorld;
			if (gWroldP.get_game_started() == true&&can_move==true)
			{
				if (Input.check(Key.LEFT))
			
				{
					x -= 50 * FP.elapsed;
				}	
				if (Input.check(Key.RIGHT))
				{
					x +=50 * FP.elapsed;
				}	
			}
			if (this.x <= FP.screen.x-500)
			{
				can_move = false;
				if (Input.check(Key.RIGHT))
				{
					can_move = true;
				}				
			}
			if (this.x >= this.width+1100)
			{
				can_move = false;
				if (Input.check(Key.LEFT))
				{
					can_move = true;
				}
			}
			super.update();
		}
	}
}