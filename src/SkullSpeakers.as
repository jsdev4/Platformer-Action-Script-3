package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Juan
	 */
	public class SkullSpeakers extends Entity 
	{
		[Embed(source = "skull_speakers_sprite_sheet.png")]
		private const SKULL_ANIM:Class;
		private var skull_speakers_anim:Spritemap;
		public function SkullSpeakers(px:Number=0,py:Number=0) 
		{
			skull_speakers_anim = new Spritemap(SKULL_ANIM, 50, 92);
			skull_speakers_anim.add("static", [0], 0, false);
			skull_speakers_anim.add("playing", [1, 2, 3, 4, 5], 20, true);
			super(px, py, skull_speakers_anim);
			skull_speakers_anim.play("static");
		}
		override public function update():void
		{
			var gWorldS:GameWorld=FP.world as GameWorld;
			if (gWorldS.get_if_friendly_status_is_full() == 4)
			{
				skull_speakers_anim.play("playing");
			}
			super.update();
		}
	}
}