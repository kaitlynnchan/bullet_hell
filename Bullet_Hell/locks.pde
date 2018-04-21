class Lock extends GameObject {

  Lock(float incomx, float incomy) {
    x = incomx;
    y = incomy;
    //hp = 1;
  }
  
  void show() {
    image(lock, x, y, 25, 25);
  }

  void act() {
  }

  boolean isDead() {
    return lkhp <= 0;//enemiesKilled >= 500;
  }
}