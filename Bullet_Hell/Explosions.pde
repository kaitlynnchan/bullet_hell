class Explosion extends GameObject {
  int i = 0;
  Explosion(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void show() {
    image(explosionPics[i], x, y, 100, 100);
    i++;
  }
  boolean isDead() {
    return i >= 24;
  }
}

class BlueExplosion extends GameObject {
  int i2 = 0;
  BlueExplosion(float _x, float _y) {
    x = _x;
    y = _y;
  }
  void show() {
    image(blueexplosionPics[i2], x, y, 100, 100);
    if (frameCount % 3 == 0) {
      i2++;
    }
  }
  boolean isDead() {
    return i2 >= 11;
  }
}