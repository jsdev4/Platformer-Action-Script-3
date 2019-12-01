package 
{
	import net.flashpunk.Sfx;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.tweens.misc.VarTween;
	import net.flashpunk.utils.Ease;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Juan
	 */
	public class GameWorld extends World
	{
		[Embed(source = "Digital_Assassins-Lock_It_Down.mp3")]
		private const FMUSIC:Class;
		private var fmusic:Sfx;
		[Embed(source = "PROTECT3.mp3")]
		private const GOODBY:Class;
		private var goodby:Sfx;
		[Embed(source = "04- The Well.mp3")]
		private const MAINMUSIC:Class;
		private var mainmusic:Sfx;
		protected var titleText:Text;
		protected var pressText:Text;
		protected var messageOnStart:Text;
		private var messagelose:Text;
		private var messageWall:Text;
		private var messageLaptop:Text;
		private var messageSound:Text;
		private var messageWin:Text;
		private var numbers:Text;
		private var number_Of_level:int;
		private var titleTweenIn:VarTween;
		private var titleTweenOut:VarTween;
		private var pressTweenIn:VarTween;
		private var pressTweenOut:VarTween;
		private var messageSIn:VarTween;
		private var messageSOut:VarTween;
		private var messageLoseIn:VarTween;
		private var messageLoseOut:VarTween;
		private var messageWallIn: VarTween;
		private var messageWallOut: VarTween;
		private var messageLapIn: VarTween;
		private var messageLapOut: VarTween;
		private var messageSoundIn:VarTween;
		private var messageSoundOut:VarTween;
		private var messageWinIn:VarTween;
		private var messageWinOut:VarTween;
		private var status:String;
		private var game_started:Boolean;
		private var parallax:BackParallaxImage;
		private var back:Background;
		private var groundS :GroundStreet;
		private var leftWall:LeftWall;
		private var rightWall:RightWall;
		private var double_box:Dbox;
		private var double_box01:Dbox;
		private var double_box02:Dbox;
		private var double_box03:Dbox;
		private var double_box04:Dbox;
		private var double_box05:Dbox;
		private var large_platform:LargePlatform;
		private var large_platform01:LargePlatform;
		private var short_platform:ShortPlatform;
		private var short_platform01:ShortPlatform;
		private var short_platform02:ShortPlatform;
		private var short_platform03:ShortPlatform;
		private var tilted_platform:TiltedPlatform;
		private var simple_box:Sbox;
		private var simple_box01:Sbox;
		private var simple_box02:Sbox;
		private var simple_box03:Sbox;
		private var simple_box04:Sbox;
		private var simple_box05:Sbox;
		private var ground_building01:Ground;
		private var ground_building02:Ground;
		private var ground_building03:Ground;
		private var ground_building04:Ground;
		private var ground_building05:Ground;
		private var sv_00:Server;
		private var sv_01:Server;
		private var sv_02:Server;
		private var sv_03:Server;
		private var computer:Computer;
		private var computer01:Computer;
		private var computer02:Computer;
		private var computer03:Computer;
		private var skull_speakers:SkullSpeakers;
		private var skull_speakers01:SkullSpeakers;
		private var skull_speakers02:SkullSpeakers;
		private var skull_speakers03:SkullSpeakers;
		private var enemy00:Enemy;
		private var enemy01:Enemy;
		private var enemy011:Enemy;
		private var enemy02:Enemy;
		private var enemy03:Enemy;
		private var enemy04:Enemy;
		private var enemy05:Enemy;
		private var enemy055:Enemy;
		private var enemy0555:Enemy;
		private var enemy06:Enemy;
		private var enemy066:Enemy;
		private var enemy0666:Enemy;
		private var player:Player;
		private var friendly_status:Number;
		public function GameWorld() 
		{
			mainmusic = new Sfx(MAINMUSIC);
			fmusic = new Sfx(FMUSIC);
			goodby = new Sfx(GOODBY);
			this.titleText = new Text("Bugisoft the unbugged game");
			this.pressText = new Text("Press ENTER to start");
			this.messageOnStart = new Text("Bugisoft launched another exciting game\nbut it has a lot of bugs as usual!\nBefore the final release go out,\nyou have to get inside Bugisoft and put sound!\nPress ENTER"); 
			this.messageWall = new Text("This funny balls are guards, better if they don't catch me\nI have to get into the developers laptops\n and put sound in the game");
			this.messagelose = new Text("you were late to put the sound! Try again? Press ENTER");
			this.messageLaptop = new Text("This one!, Press Intro to put sound,\n and have fun with floor guards!");
			this.messageSound = new Text("Folder Sound it's in the project, beautiful!");
			this.messageWin = new Text("All the sound folders are in the final project!");
			this.titleText.color = 0xFFFFFF;
			this.titleText.alpha=0;
			this.pressText.color = 0xFFFFFF;
			this.pressText.alpha = 0;
			this.pressText.scale = 0.6;
			this.messageOnStart.alpha = 0;
			this.messageOnStart.scale = 0.6;
			this.messagelose.scale = 0.6;
			this.messagelose.alpha = 0;
			this.messageWall.scale = 0.6;
			this.messageWall.alpha = 0;
			this.messageLaptop.scale = 0.6;
			this.messageLaptop.alpha = 0;
			this.messageSound.scale = 0.6;
			this.messageSound.alpha = 0;
			this.messageWin.scale = 0.6;
			this.messageWin.alpha = 0;
			this.titleText.x = (FP.screen.x + 50);
			this.titleText.y = (FP.screen.y+20);
			this.pressText.x = (FP.screen.x+50);	
			this.pressText.y = (FP.screen.y+180);
			this.messageOnStart.x = FP.screen.x + 50;
			this.messageOnStart.y = FP.screen.y + 180;
			titleTweenIn = new VarTween();
			titleTweenOut = new VarTween();
			pressTweenIn = new VarTween();
			pressTweenOut = new VarTween();
			messageSIn = new VarTween();
			messageSOut = new VarTween();
			messageLoseIn = new VarTween();
			messageLoseOut = new VarTween();
			messageWallIn = new VarTween();
			messageWallOut = new VarTween();
			messageLapIn = new VarTween();
			messageLapOut = new VarTween();
			messageSoundIn = new VarTween();
			messageSoundOut = new VarTween();
			messageWinIn = new VarTween();
			messageWinOut = new VarTween();
			this.status = "START";
			game_started = false;
			friendly_status = 0;
			parallax = new BackParallaxImage(FP.screen.x - 297, FP.screen.y - 1500);
			back = new Background(FP.screen.x, FP.screen.y - 1200);
			groundS = new GroundStreet(0, 204);
			leftWall = new LeftWall(FP.screen.x - 80, FP.screen.y - 1680);
			rightWall = new RightWall(FP.screen.x + 640, FP.screen.y - 1680);
			double_box = new Dbox(FP.screen.x + 562, FP.screen.y + 166);
			double_box01 = new Dbox(FP.screen.x + 5, FP.screen.y + 104);
			double_box02 = new Dbox(FP.screen.x + 102, FP.screen.y - 173);
			double_box03 = new Dbox(FP.screen.x + 230, FP.screen.y -756 );			  //boxground04
			double_box04 = new Dbox(FP.screen.x + 472, FP.screen.y -306 );           //box ground02
			double_box05 = new Dbox(FP.screen.x+120 , FP.screen.y -550 );                //box ground03
			large_platform = new LargePlatform(FP.screen.x, FP.screen.y + 142);
			large_platform01 = new LargePlatform(FP.screen.x, FP.screen.y - 135);
			short_platform = new ShortPlatform(FP.screen.x + 60, FP.screen.y + 26);
			short_platform01 = new ShortPlatform(FP.screen.x + 427, FP.screen.y -436);//   ground02
			short_platform02 = new ShortPlatform(FP.screen.x + 470, FP.screen.y -865);//  ground04
			short_platform03 = new ShortPlatform(FP.screen.x + 570, FP.screen.y -885);//ground04
			simple_box = new Sbox(FP.screen.x + 5, FP.screen.y + 70);
			simple_box01 = new Sbox(FP.screen.x + 102, FP.screen.y - 207);
			simple_box02 = new Sbox(FP.screen.x+503, FP.screen.y - 341);             //box ground02
			simple_box03 = new Sbox(FP.screen.x, FP.screen.y - 648);
			simple_box04 = new Sbox(FP.screen.x + 230, FP.screen.y - 788);			 //box gropund04
			simple_box05 = new Sbox(FP.screen.x+120, FP.screen.y - 584);
			ground_building01 = new Ground(FP.screen.x, FP.screen.y - 23);
			ground_building02 = new Ground(FP.screen.x, FP.screen.y - 272);
			ground_building03 = new Ground(FP.screen.x, FP.screen.y - 512);
			ground_building04 = new Ground(FP.screen.x, FP.screen.y - 722);
			ground_building05 = new Ground(FP.screen.x, FP.screen.y - 960);
			tilted_platform = new TiltedPlatform(FP.screen.x + 476, FP.screen.y - 111);
			sv_00 = new Server(FP.screen.x +537, FP.screen.y - 377);                //server ground02
			sv_01 = new Server(FP.screen.x + 25, FP.screen.y - 614);                //server ground03
			sv_02 = new Server(FP.screen.x + 290, FP.screen.y - 825);               //ground server04
			sv_03 = new Server(FP.screen.x + 450, FP.screen.y - 1064);				//ground server05
			computer = new Computer(FP.screen.x + 290, FP.screen.y - 335,2);
			computer01 = new Computer(FP.screen.x + 225, FP.screen.y - 573,3);//computer ground03
			computer02 = new Computer(FP.screen.x + 55, FP.screen.y - 783, 4);
			computer03 = new Computer(FP.screen.x + 25, FP.screen.y - 1021, 5);
			skull_speakers = new SkullSpeakers(FP.screen.x + 80, FP.screen.y - 1052);
			skull_speakers01 = new SkullSpeakers(FP.screen.x + 140, FP.screen.y - 1052);
			skull_speakers02 = new SkullSpeakers(FP.screen.x + 200, FP.screen.y - 1052);
			skull_speakers03 = new SkullSpeakers(FP.screen.x + 260, FP.screen.y - 1052);
			enemy00 = new Enemy(FP.screen.x + 640, FP.screen.y + 190, 0);
			enemy01 = new Enemy(FP.screen.x + 140, FP.screen.y -38, 1);
			enemy011 = new Enemy(FP.screen.x + 640, FP.screen.y - 38, 1);
			enemy02 = new Enemy(FP.screen.x + 20, FP.screen.y - 150, 2);//enemy platform
			enemy03 = new Enemy(FP.screen.x + 250, FP.screen.y - 287, 3);
			enemy04 = new Enemy(FP.screen.x + 500, FP.screen.y - 527, 4);
			enemy05 = new Enemy(FP.screen.x + 20, FP.screen.y - 737, 5);
			enemy055 = new Enemy(FP.screen.x + 400, FP.screen.y -  737, 5);
			enemy0555 = new Enemy(FP.screen.x + 40, FP.screen.y -  737, 5);
			enemy06 = new Enemy(FP.screen.x + 15, FP.screen.y - 975,6);
			enemy066 = new Enemy(FP.screen.x + 215, FP.screen.y - 975,6);
			enemy0666 = new Enemy(FP.screen.x + 615, FP.screen.y - 975,6);
			player = new Player(55, 155);
			this.add(parallax);
			this.add(back);
			this.add(leftWall);
			this.add(rightWall);
			this.add(groundS);
			this.add(double_box);
			this.add(double_box01);
			this.add(double_box02);
			this.add(double_box03);
			this.add(double_box04);
			this.add(double_box05);
			this.add(large_platform);
			this.add(large_platform01);
			this.add(short_platform);
			this.add(short_platform01);
			this.add(short_platform02);
			this.add(short_platform03);
			this.add(simple_box);
			this.add(simple_box01);
			this.add(simple_box02);
			this.add(simple_box03);
			this.add(simple_box04);
			this.add(simple_box05);
			this.add(ground_building01);
			this.add(ground_building02);
			this.add(ground_building03);
			this.add(ground_building04);
			this.add(ground_building05);
			this.add(tilted_platform);
			this.add(sv_00);
			this.add(sv_01);
			this.add(sv_02);
			this.add(sv_03);
			this.add(computer);
			this.add(computer01);
			this.add(computer02);
			this.add(computer03);
			this.add(skull_speakers);
			this.add(skull_speakers01);
			this.add(skull_speakers02);
			this.add(skull_speakers03);
			this.add(enemy00);
			this.add(enemy01);
			this.add(enemy011);
			this.add(enemy02);
			this.add(enemy03);
			this.add(enemy04);
			this.add(enemy05);
			this.add(enemy055);
			this.add(enemy0555);
			this.add(enemy06);
			this.add(enemy066);
			this.add(enemy0666);
			this.add(player);
			this.addGraphic(titleText);
			this.addGraphic(pressText);
			this.addGraphic(messageOnStart);
			this.addGraphic(messagelose);
			this.addTween(titleTweenIn);
			this.addTween(pressTweenIn);
			this.addTween(titleTweenOut);
			this.addTween(pressTweenOut);
			this.addTween(messageSIn);
			this.addTween(messageSOut);
			this.addTween(messageLoseIn);
			this.addTween(messageLoseOut);
			this.addGraphic(messageWall);
			this.addTween(messageWallIn);
			this.addTween(messageWallOut);
			this.addGraphic(messageLaptop);
			this.addTween(messageLapIn);
			this.addTween(messageLapOut);
			this.addGraphic(messageSound);
			this.addTween(messageSoundIn);
			this.addTween(messageSoundOut);
			this.addGraphic(messageWin);
			this.addTween(messageWinIn);
			this.addTween(messageWinOut);
			number_Of_level = 1;
			numbers = new Text(number_Of_level.toString());
			this.addGraphic(numbers);
			this.numbers.visible = false;	
		}
		override public function update():void
		{
			switch (status)
			{
					case "START": 
				{
					titleTweenIn.tween(titleText, "alpha", 1, 3);
					pressTweenIn.tween(pressText, "alpha", 1, 3);
					this.status = "WAIT1";
					break;
				}
				case "TO": 
				{
					if (Input.check(Key.ENTER))
					{
						titleTweenOut.tween(titleText, "alpha", 0, 3);
						pressTweenOut.tween(pressText, "alpha", 0, 3);
						mainmusic.play();
						this.status = "WAIT2";
					}
					break;
				}
				case "MESSAGE": 
				{
					messageSIn.tween(messageOnStart, "alpha", 1, 3);
					if (Input.check(Key.ENTER))
					{
						this.status = "WAIT3";
					}
					break;
				}
				case "GAME": 
				{
					messageSOut.tween(messageOnStart, "alpha", 0, 1);
					game_started = true;
					FP.camera.y = this.player.y - 154;
					this.messageLaptop.x = FP.camera.x + 20;
					this.messageLaptop.y = FP.camera.y + 100;
					this.numbers.visible = true;
					numbers.text = number_Of_level.toString();
					this.numbers.x =FP.camera.x+5;
					this.numbers.y = FP.camera.y + 5;
					if (this.player.x >= 270 && this.player.x <= 280)
					{
						if (this.player.y<=FP.screen.y+150&&this.player.y>=FP.screen.y+90)
						{
							messageWallIn.tween(messageWall, "alpha", 1, 2);
						}
					}
					if (this.player.x<=270||this.player.x>=280)
					{
						if (this.player.y>=FP.screen.y+150||this.player.y<=FP.screen.y+90)
						{
							messageWallOut.tween(messageWall, "alpha", 0, 1);
						}
					}
					//laptop
					if (this.player.x >= FP.screen.x+270 && this.player.x <=FP.screen.x+ 290)
					{
						if (this.player.y<=FP.screen.y-272&&this.player.y>=FP.screen.y-370)
						{
							messageLapIn.tween(messageLaptop, "alpha", 1, 2);
						}
					}
					if (this.player.x >= FP.screen.x+270|| this.player.x <= FP.screen.x+ 290)
					{
						if (this.player.y<=FP.screen.y-272||this.player.y>=FP.screen.y-370)
						{
							messageLapOut.tween(messageLaptop, "alpha", 0, 1);
						}
					}
					//laptop01
					if (this.player.x >= FP.screen.x+215 && this.player.x <=FP.screen.x+ 235)
					{
						if (this.player.y<=FP.screen.y-570&&this.player.y>=FP.screen.y-670)
						{
							messageLapIn.tween(messageLaptop, "alpha", 1, 2);
						}
					}
					if (this.player.x >= FP.screen.x+215|| this.player.x <= FP.screen.x+ 235)
					{
						if (this.player.y<=FP.screen.y-570||this.player.y>=FP.screen.y-640)
						{
							messageLapOut.tween(messageLaptop, "alpha", 0, 1);
						}
					}
					//laptop02
					if (this.player.x >= FP.screen.x+45 && this.player.x <=FP.screen.x+ 65)
					{
						if (this.player.y<=FP.screen.y-760&&this.player.y>=FP.screen.y-840)
						{
							messageLapIn.tween(messageLaptop, "alpha", 1, 2);
						}
					}
					if (this.player.x >= FP.screen.x+45|| this.player.x <= FP.screen.x+ 65)
					{
						if (this.player.y<=FP.screen.y-760||this.player.y>=FP.screen.y-840)
						{
							messageLapOut.tween(messageLaptop, "alpha", 0, 1);
						}
					}
					//laptop03
					if (this.player.x >= FP.screen.x+35 && this.player.x <=FP.screen.x+ 55)
					{
						if (this.player.y<=FP.screen.y-1000&&this.player.y>=FP.screen.y-1080)
						{
							messageLapIn.tween(messageLaptop, "alpha", 1, 2);
						}
					}
					if (this.player.x >= FP.screen.x+15|| this.player.x <= FP.screen.x+ 35)
					{
						if (this.player.y<=FP.screen.y-1000||this.player.y>=FP.screen.y-1080)
						{
							messageLapOut.tween(messageLaptop, "alpha", 0, 1);
						}
					}
					//message put sound
					if (friendly_status == 1)
					{
						goodby.play();
						this.messageSound.x = FP.camera.x + 50;
						this.messageSound.y = this.player.y;
						messageSoundIn.tween(messageSound, "alpha", 1, 1);
						friendly_status = 1.5;
						this.computer.collidable = false;
						number_Of_level += 1;
					}
					if (friendly_status==1.5)
					{
							messageSoundOut.tween(messageSound, "alpha", 0, 1);
					}
					if (friendly_status == 2)
					{
						goodby.play();
						this.messageSound.x = FP.camera.x + 50;
						this.messageSound.y = this.player.y;
						messageSoundIn.tween(messageSound, "alpha", 1, 1);
						friendly_status = 2.5;
						this.computer01.collidable = false;
						number_Of_level += 1;
					}
					if (friendly_status==2.5)
					{
							messageSoundOut.tween(messageSound, "alpha", 0, 1);
					}
					if (friendly_status == 3)
					{
						goodby.play();
						this.messageSound.x = FP.camera.x + 50;
						this.messageSound.y = this.player.y;
						messageSoundIn.tween(messageSound, "alpha", 1, 1);
						friendly_status = 3.5;
						this.computer02.collidable = false;
						number_Of_level += 1;
					}
					if (friendly_status==3.5)
					{
							messageSoundOut.tween(messageSound, "alpha", 0, 1);
					}
					if (friendly_status == 4)
					{
						goodby.play();
						this.messageSound.x = FP.camera.x + 50;
						this.messageSound.y = this.player.y;
						messageSoundIn.tween(messageSound, "alpha", 1, 1);
						friendly_status = 4.5;
						this.computer03.collidable = false;
						number_Of_level += 1;
					}
					if (friendly_status==4.5)
					{
							messageSoundOut.tween(messageSound, "alpha", 0, 1);
					}
					//end meesagesounds
					if (player.get_if_is_killed() == true)
					{
						this.messagelose.x = FP.camera.x + 20;
						this.messagelose.y = FP.camera.y + 10;
						messageLoseIn.tween(messagelose, "alpha", 1, 2);
						this.status = "LOSE";
					}
					if (number_Of_level==4)
					{
						mainmusic.stop();
						this.messageLaptop.visible = false;
						this.messageWin.x = FP.camera.x + 20;
						this.messageWin.y = FP.camera.y + 20;
						messageWinIn.tween(messageWin, "alpha", 1, 3);
						fmusic.play();
						this.status = "WIN";
					}
					if (number_Of_level < 4 && player.return_if_finished() == true)
					{
						this.messagelose.x = FP.camera.x + 20;
						this.messagelose.y = FP.camera.y + 10;
						messageLoseIn.tween(messagelose, "alpha", 1, 2);
						this.status = "LOSE";
					}
					break;
				}
				case "MESSAGELOSE":
				{		
					if (Input.check(Key.ENTER))
					{		
						messageLoseOut.tween(messagelose, "alpha", 0, 3);
						this.status = "RESTART";
					}			
					break;
				}
				case "MESSAGEWIN":
				{
					if (Input.check(Key.ENTER))
					{
						messageWinOut.tween(messageWin, "alpha", 0, 6);
						this.status = "RESTART";
					}
					break;	
				}
			}
			if (titleTweenIn.percent == 1 && pressTweenIn.percent == 1 && this.status == "WAIT1")
			{
				this.status = "TO";
			}
			if (titleTweenOut.percent == 1 && pressTweenOut.percent == 1 && this.status == "WAIT2")
			{
				this.status = "MESSAGE";
			}
			if (messageSIn.percent == 0&& this.status == "WAIT3")
			{
				this.status = "GAME";
			}
			if (messageLoseIn.percent ==1 && this.status == "LOSE")
			{
				this.status = "MESSAGELOSE";
			}
			if (messageLoseOut.percent ==1 && this.status == "RESTART")
			{
				mainmusic.stop();
				FP.world = new GameWorld();
			}
			if (messageWinOut.percent ==1 && this.status == "RESTART")
			{
				if (Input.check(Key.ENTER))
				{
					fmusic.stop();
					FP.world = new GameWorld();
				}
			}
			if (messageWinIn.percent == 0 && this.status == "WIN")
			{
				this.status = "MESSAGEWIN";
			}
			super.update();
		}
		public function get_game_started():Boolean
		{
			return game_started;
		}
		public function get_the_transform():void
		{
			this.player.visible = false;
		}
		public function set_friendly_enemy(on_level:int):void
		{
			friendly_status =on_level;
		}
		public function get_friendly_enemy():int
		{
			return friendly_status;
		}
		public function get_if_friendly_status_is_full():int
		{
			return friendly_status;
		}
	}
}
