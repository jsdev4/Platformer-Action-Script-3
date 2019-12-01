package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Juan
	 */
	public class Background extends Entity
	{
		[Embed(source = "background.png")]
		private const BACKGR:Class;
		private var back_:Image;
		public function Background(px:Number=0,py:Number=0) 
		{
			back_ = new Image(BACKGR);
			super(px, py, back_);
		}
		override public function update():void
		{
			super.update();
		}	
	}
}