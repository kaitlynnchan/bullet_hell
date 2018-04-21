class Ship extends GameObject {

  Gun myGun;
  int lives;

  Ship() {
    x = width/2 - w/2;
    y = 500;
    dx = 0;
    dy = 0;
    w = 50;
    h = 60;
    hp = 500;
    myGun = new BasicGun();
    lives = 50;
  }

  void show() {
    rectMode(CENTER);
    image(Ship, x, y, w, h);
  }

  void act() {
    dx = 0;
    dy = 0;
    if (wkey) dy += -3;
    if (akey) dx += -3;
    if (skey) dy += 3;
    if (dkey) dx += 3;
    if (spacekey) myGun.shoot();//engine.add(new Bullet())


    x += dx;
    y += dy;

    if (x - w/2 <= playx) x = playx + w/2;
    if (x >= playw - w/2) x = playw - w/2;
    if (y - h/2 <= playy) y = playy + h/2;
    if (y >= playh - w/2) y = playh - w/2;

    if (onekey) {
      myGun = new BasicGun();
      gunmode = 0;
    }
    if (twokey) {
      myGun = new MachineGun();
      gunmode = 1;
    }
    if (threekey) {
      myGun = new vGun();
      gunmode = 2;
    }
    if (fourkey) {
      myGun = new SprinklerGun();
      gunmode = 3;
    }
    if (fivekey) {
      myGun = new ArrowGun();
      gunmode = 4;
    }
    if (sixkey) {
      myGun = new CircleGun();
      gunmode = 5;
    }

    if (bkey && boostam > 0) {
      engine.add(new ForceField(myship.x, myship.y));
      boostam -= 1;
      //boostam -= 1;
    }
    myGun.recharge();
    checkCollisions();

    //if(healthmeter == 50){
    //  float i = 0;
    //  while(i < 1){
    //    engine.add(new GlowingBall());
    //    i++;
    //  }
    //}
  }

  void checkCollisions() {
    int i = 0;
    int i2 = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good == false) { // looking for bullets
        if (rectRect(x, y, w, h, thing.x, thing.y, thing.w, thing.h)) {
          hp += -10;
          thing.hp = 0;
          healthmeter -= 1;
          engine.add(new Explosion(x, y));
          explosion.rewind();
          explosion.play();
          if (healthmeter <= 0) mode = LOSE;
        }
      }
      i++;
    }

    while (i2 < engine.size()) {
      GameObject thing = engine.get(i2);
      if (thing instanceof GlowingBall) { // looking for bullets
        if (rectRect(x, y, w, h, thing.x, thing.y, thing.w, thing.h)) {
          healthmeter += 10;
          thing.hp = 0;
          if (healthmeter >= 130) healthmeter = 130;
        }
      }
      i2++;
    }
  }

  boolean isDead() {
    return healthmeter <= 0;//hp <= 0  healthmeter <= 0
  }
}