class Enemy extends GameObject {

  Enemy(float incomingx, float incomingy, float _hp) {
    x = incomingx;
    y = incomingy;
    dx = 0;
    dy = 5;
    hp = _hp;
    w = 50;
    h = 50;
  }

  void show() {
    fill(green);
    stroke(green);
    rectMode(CENTER);
    //rect(x, y, w, h);
    image(enemy, x, y, w, h);
  }

  void act() {
    x += dx;
    y += dy;
    if (frameCount % 50 == 0) {
      engine.add(new Bullet(x, y, 0, 15, false));
      //bullet.rewind();
      //bullet.play();
    }

    checkCollisions();
  }

  void checkCollisions() {
    int i = 0;
    while (i < engine.size()) {
      GameObject bullet = engine.get(i);
      if (bullet instanceof Bullet && bullet.good == true) { // looking for bullets
        if (rectRect(x, y, w, h, bullet.x, bullet.y, bullet.w, bullet.h)) {
          hp += -1;
          bullet.hp = 0;
          enemiesKilled -= 1;//////////////////// += 100
          engine.add(new BlueExplosion(x, y));
          explosion.rewind();
          explosion.play();
          enemyhealth -= 1;
          //for(int j = 0; j < 5; j++){
          //  engine.add(new Particle(bullet.x, bullet.y));
          //}
        }
      }
      i++;
    }

    int i2 = 0;
    while (i2 < engine.size()) {
      GameObject bullet = engine.get(i2);
      if (bullet instanceof CircleBullet && bullet.good == true) { // looking for bullets
        if (rectBall(x, y, w, h, bullet.x, bullet.y, bullet.w)) {
          hp += -1;
          bullet.hp -= 1;
          enemiesKilled -= 1; ////////////////////// +=100
          engine.add(new BlueExplosion(x, y));
          explosion.rewind();
          explosion.play();
          enemyhealth -= 1;
          //for(int j = 0; j < 5; j++){
          //  engine.add(new Particle(bullet.x, bullet.y));
          //}
        }
      }
      i2++;
    }
  }

  boolean isDead() {
    return y >= playh - w/2 || hp <= 0 || x >= playw || x <= playx;
  }
}

class FastEnemy extends Enemy {

  FastEnemy(float incomingX, float incomingY, float _hp) {
    super(incomingX, incomingY, _hp);
    dy = 10;
  }
}


class GunShipEnemy extends Enemy {

  GunShipEnemy(float incomingX, float incomingY, float _hp) {
    super(incomingX, incomingY, _hp);
    w = 75;
    h = 75;
    hp = 50;
  }

  void show() {
    fill(darkgreen);
    stroke(darkgreen);
    rect(x, y, w, h);
  }

  void act() {
    if (y < height/2) {
      x += dx;
      y += dy;
    }
  }
}


class EnemyLevelTwo extends Enemy {

  EnemyLevelTwo(float incomingX, float incomingY, float _hp) {
    super(incomingX, incomingY, _hp);
    hp = _hp;
  }
}


class BossLevelOne extends Enemy {

  BossLevelOne(float incomingX, float incomingY, float _hp) {
    super(incomingX, incomingY, _hp);
    w = 100;
    h = 100;
    hp = _hp;
  }

  void show() {
    //health box
    fill(white);
    stroke(white);
    strokeWeight(1);
    rectMode(CORNER);
    rect(x - w/2, y - h, 200, 20);

    //lives meter
    fill(green);
    stroke(green);
    rectMode(CORNER);
    strokeWeight(1);
    rect(x - w/2, y - h, enemyhealth, 20);


    image(enemy, x, y, w, h);
  }

  void act() {
    if (y < height/2) {
      
      x += dx;
      y += dy;
    }
    if (frameCount % 50 == 0 && y == height/2) {
      engine.add(new Bullet(x, y, -3, 15, false));
      engine.add(new Bullet(x, y, 3, 15, false));
      engine.add(new Bullet(x, y, -3, 15, false));
      engine.add(new Bullet(x, y, 3, 15, false));
      engine.add(new Bullet(x, y, -3, -15, false));
      engine.add(new Bullet(x, y, 3, -15, false));
      engine.add(new Bullet(x, y, -3, -15, false));
      engine.add(new Bullet(x, y, 3, -15, false));
      //bullet.rewind();
      //bullet.play();
    }

    checkCollisions();
  }

  boolean isDead() {
    return enemyhealth <= 0;
  }
}