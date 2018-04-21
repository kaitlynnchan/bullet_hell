class Bullet extends GameObject {


  Bullet() {
    w = 3;
    h = 8;
    hp = 1;
    x = myship.x - w/2;
    y = myship.y - myship.h/2;
    dx = 0;
    dy = -5;
    good = true;
  }

  Bullet(float _Dx, float _Dy) {
    w = 3;
    h = 8;
    hp = 1;
    x = myship.x - w/2;
    y = myship.y - myship.h/2;
    dx = _Dx;
    dy = _Dy;
    //dx = random(-3, 3);
    //dy = -5;
    good = true;
  }
  
  Bullet(float _Dx, float _Dy, float _x) {
    w = 3;
    h = 8;
    hp = 1;
    x = _x;
    y = myship.y - myship.h/2;
    dx = _Dx;
    dy = _Dy;
    //dx = random(-3, 3);
    //dy = -5;
    good = true;
  }
  
  Bullet(float _Dx, float _y, boolean _good) {
    w = 3;
    h = 8;
    hp = 1;
    x = myship.x - myship.w/2;
    y = _y;
    dx = _Dx;
    dy = 0;
    //dx = random(-3, 3);
    //dy = -5;
    good = _good;
  }


  Bullet(float _x, float _y, float _dx, float _dy, boolean _good) {
    w    = 3;
    h    = 8;
    hp   = 1; 
    x    = _x;
    y    = _y;
    dx   = _dx;
    dy   = _dy;
    good= _good;
  }
  
  void show() {
    if (good == false) {
      image(greenlaser, x, y, w, h);
    } else if (good == true) {
      image(redlaser, x, y, w, h);
    }

    rectMode(CENTER);
  }

  void act() {
    if (spacekey) {
      x += dx;
      y += dy;
    }
    x += dx;
    y += dy;
  }

  boolean isDead() {
    return y >= playh || y <= playy || x >= playw || x <= playx || hp <= 0;                 //|| w >= playw; //(y >= height + 25 || y <= 0) || hp <= 0 || hp < 0
  }
}



class CircleBullet extends GameObject {
  CircleBullet() {
    w = 3;
    hp = 20;
    x = myship.x - w/2;
    y = myship.y - myship.h/2;
    dx = 5;
    good = true;
    gundead = false;
  }


  void show() {
    if (good) {
      noFill();
      stroke(red);
      strokeWeight(2);
      ellipse(x, y, w, w);
    }
  }

  void act() {
    if (spacekey) {
      w += dx;
      circlegunammo -= 1;
    }
    w += dx;
    if (circlegunammo <= 0) gundead = true;
  }

  boolean isDead() {
    return w >= width || hp <= 0; //(y >= height + 25 || y <= 0) || hp <= 0 || hp < 0
  }
}