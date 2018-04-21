
import ddf.minim.*;
Minim minim;

final int INTRO = 1;
final int PLAY = 2;
final int TUTORIAL = 6;
final int PAUSE = 3;
final int LOSE = 4;
final int WIN = 5;
int mode = INTRO;

ArrayList<GameObject> engine;
boolean wkey, akey, skey, dkey, spacekey;
boolean onekey, twokey, threekey, fourkey, fivekey, sixkey, sevenkey, eightkey, rightkey, nkey, bkey;
Ship myship;
Launcher thelauncher;

PImage Ship, glowingball, gun, gun2, gun3, gun4, gun5, gun6, background, introbackground, enemy, keycontrol, lock, spacecontrol, greenlaser, redlaser;
PImage[] explosionPics;
PImage[] blueexplosionPics;
PFont font;

AudioPlayer locked;
AudioPlayer bullet;
AudioPlayer explosion;
AudioPlayer music;
AudioInput input;

color white = #FFFFFF;
color black = #000000;
color red = #FF0000;
color blue = #52B4E8;
color lightsaberred = #CE0C2C;
color green = #2E8E2E;//#14D81F
color lightgreen = #17FF15;
color darkgreen = #016C00;
color grey = #74706D;
color orange = #D3741A;
color yellow = #F5DB59;

int enemiesKilled = 10;
int healthmeter = 130;
int enemyhealth = 200;
int c = 0;

float playx, playy, playw, playh;
float selectx, selecty;
float tutoriala, fade, f, fade2, f2;
int gunmode = 0;
int lkhp = 1;
int circlegunammo = 3;
int boostam = 1;
int newgun = 0;
boolean gundead;
boolean message;

void setup() {
  size(800, 600, FX2D);
  rectMode(CENTER);
  imageMode(CENTER);

  explosionPics = new PImage[25];
  blueexplosionPics = new PImage[12];
  engine = new ArrayList<GameObject>(10000);
  myship = new Ship();
  engine.add(myship);
  thelauncher = new Launcher();
  engine.add(thelauncher);

  Ship = loadImage("images/spaceship2.png");
  glowingball = loadImage("images/glowingball.png");
  gun = loadImage("images/gun.png");
  gun2 = loadImage("images/gun2.png");
  gun3 = loadImage("images/gun3.png");
  gun4 = loadImage("images/gun4.png");
  gun5 = loadImage("images/gun5.png");
  gun6 = loadImage("images/gun6.png");
  background = loadImage("images/background.jpg");
  introbackground = loadImage("images/shipbackground.jpg");
  enemy = loadImage("images/enemy1.png");
  keycontrol = loadImage("images/wasd.png");
  spacecontrol = loadImage("images/space-bar.png");
  lock = loadImage("images/lock.png");
  greenlaser = loadImage("images/green-laser.png");
  redlaser = loadImage("images/red-laser.png");
  font = createFont("stormfaze.ttf", 20);
  minim = new Minim(this);
  locked = minim.loadFile("audio/Door Lock Sound Effect.mp3");
  bullet = minim.loadFile("audio/Gun-sounds2.mp3");
  explosion = minim.loadFile("audio/Explosion2.mp3");
  music = minim.loadFile("audio/dubstep.mp3");
  input = minim.getLineIn();

  playx = 0;//25;
  playy = 0;//25;
  playw = width/2 + 150;
  playh = height;
  fade = 0;
  fade2 = 0;
  f = 3;
  f2 = 3;

  int i = 0;
  while (i <= 24) {
    explosionPics[i] = loadImage("images/explosion_" + i + ".png");
    i++;
  }

  int i2 = 0;
  while (i2 <= 11) {
    blueexplosionPics[i2] = loadImage("images/BlueExplosionPNG_" + i2 + ".png");
    i2++;
  }
}

void draw() {
  //background(black);
  textFont(font);

  if (mode == INTRO) {
    drawINTRO();
    //setup();
    //music.play();
  } else if (mode == PLAY) {
    runEngine();
    drawPLAY();
    //engine.add(new Star());
  } else if (mode == TUTORIAL) {
    runEngine();
    drawTUTORIAL();
    //engine.add(new Star());
  } else if (mode == PAUSE) {
    drawPAUSE();
  } else if (mode == LOSE) {
    runEngine();
    drawLOSE();
  } else if (mode == WIN) {
    runEngine();
    drawWIN();
  } else {
    println("Error: unexpected mode: " + mode);
  }
}

void runEngine() {
  background(black);
  //engine
  int i = engine.size() - 1; //star at end to avoid problems with removing
  while (i >= 0) {
    GameObject obj = engine.get(i);
    obj.show();
    obj.act();
    if (obj.isDead()) {
      engine.remove(i);
    }
    i--;
  }
}

void keyPressed() {
  if (mode == PLAY || mode == TUTORIAL) {
    if (key == 'w' || key == 'W') wkey = true;
    if (key == 'a' || key == 'A') akey = true;
    if (key == 's' || key == 'S') skey = true;
    if (key == 'd' || key == 'D') dkey = true;
    if (key == 'b' || key == 'B') bkey = true;
    if (key == ' ') spacekey = true;
    if (key == '1') onekey = true;
    if (key == '2') twokey = true;
    if (key == '3') threekey = true;
    if (key == '4') fourkey = true;
    if (key == '5') fivekey = true;
    if (key == '6') sixkey = true;
    if (key == '7') sevenkey = true;
    if (key == '8') eightkey = true;
    //if(keyCode == RIGHT) rightkey = true;
  }
  if (mode == TUTORIAL) {
    if (key == 'n' || key == 'N') nkey = true;
  }
  if (mode == PAUSE && key == ' ') mode = PLAY;
}

void keyReleased() {
  if (mode == PLAY || mode == TUTORIAL) {
    if (key == 'w' || key == 'W') wkey = false;
    if (key == 'a' || key == 'A') akey = false;
    if (key == 's' || key == 'S') skey = false;
    if (key == 'd' || key == 'D') dkey = false;
    if (key == 'b' || key == 'B') bkey = false;
    if (key == ' ') spacekey = false;
    if (key == '1') onekey = false;
    if (key == '2') twokey = false;
    if (key == '3') threekey = false;
    if (key == '4') fourkey = false;
    if (key == '5') fivekey = false;
    if (key == '6') sixkey = false;
    if (key == '7') sevenkey = false;
    if (key == '8') eightkey = false;
    //if(keyCode == RIGHT) rightkey = false;
  }
  if (mode == TUTORIAL) {
    if (key == 'n' || key == 'N') nkey = true;
  }
  if (mode == PAUSE && key == 'p' || key == 'P') mode = PAUSE;
}

void mouseReleased() {
  if (mode == INTRO && mouseX > 328 && mouseX < 473 && mouseY > 308 && mouseY < 350) { mode = PLAY; frameCount = 0; }
  //if (mode == INTRO && mouseX > 225 && mouseX < 575 && mouseY > 413 && mouseY < 450) mode = INSTRUCTIONS;
  if (mode == INTRO && mouseX > 280 && mouseX < 518 && mouseY > 413 && mouseY < 450) mode = TUTORIAL;
  if (mode == PLAY && mouseX > 762 && mouseX < 771 && mouseY > 6 && mouseY < 30) mode = PAUSE;
  if (mode == TUTORIAL && mouseX > 762 && mouseX < 771 && mouseY > 6 && mouseY < 30) mode = PAUSE;
  if (mode == PAUSE && mouseX > 40 && mouseX < 101 && mouseY > 531 && mouseY < 550) mode = PLAY;
  if (mode == PAUSE && mouseX > 450 && mouseX < 523 && mouseY > 531 && mouseY < 550) mode = INTRO;
  if (mode == LOSE && mouseX > 590 && mouseX < 762 && mouseY > 530 && mouseY < 550) mode = INTRO;
  if(mode == TUTORIAL && mouseX > 350 && mouseX < 425 && mouseY > 521 && mouseY < 556) { mode = PLAY; frameCount = 0; }
}