class Particle extends GameObject {

  Particle(float incomingX, float incomingY) {
    x = incomingX;
    y = incomingY;
    dx = random(-5, 5);
    dy = random(-5, 5);
    hp = random(100, 255);
    w = 3;
    h = 3;
  }

  void show() {
    fill(yellow, hp);
    stroke(yellow, hp);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void act() {
    x += dx;
    y += dy;

    hp -= 2;
  }

  boolean isDead() {
    return hp <= 0;
  }
}