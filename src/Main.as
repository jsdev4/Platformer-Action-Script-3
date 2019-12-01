package
{
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Juan
	 */
	[SWF(width="320",height="240")]
	public class Main  extends Engine
	
	{
		
		public function Main() :void
		{
			super(640, 480, 30,false);
			
			FP.screen.color = 0x000000;
			
			FP.world = new GameWorld();
		}
	}
}