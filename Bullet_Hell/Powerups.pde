class GlowingBall extends GameObject {
  GlowingBall(float incomingx, float incomingy) { 
    x = incomingx;
    y = incomingy;
    w = 100;
    h = 100;
    hp = 1;
  }

  void show() {
    fill(white);
    image(glowingball, x, y, w, h);
  }

  void act() {
  }

  boolean isDead() {
    return hp <= 0;
  }
}

class ForceField extends GameObject {
  ForceField(float incomingx, float incomingy) { 
    x = incomingx;
    y = incomingy;
    w = 200;
    hp = 30;
  }

  void show() {
    noFill();
    stroke(blue);
    ellipse(x, y, w, w);
  }

  void act() {

    x = myship.x;
    y = myship.y;
    
    checkCollisions();
  }

  void checkCollisions() {
    int i = 0;
    int i2 = 0;
    while (i < engine.size()) {
      GameObject thing = engine.get(i);
      if (thing instanceof Bullet && thing.good == false) { // looking for bullets
        if (rectBall(thing.x, thing.y, thing.w, thing.h, x, y, w)) {
          //hp += -1;
          //thing.hp = 0;
          thing.dx = (thing.x - x)/11;
          thing.dy = (thing.y - y)/11;
        }
      }
      i++;
    }
    
    
    while (i2 < engine.size()) {
      GameObject thing = engine.get(i2);
      if (thing instanceof Enemy) { // looking for bullets
        if (rectBall(thing.x, thing.y, thing.w, thing.h, x, y, w)) {
          hp += -1;
          thing.hp -= 1;
          engine.add(new BlueExplosion(thing.x, thing.y));
          explosion.rewind();
          explosion.play();
          enemiesKilled -= 1; // += 100
          enemyhealth -= 1;
        }
      }
      i2++;
    }
  }

  boolean isDead() {
    return hp <= 0 || healthmeter <= 0;
  }
}