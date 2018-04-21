abstract class Gun {

  float cooldown, threshold;

  Gun() {
  }

  void shoot() {
    if (cooldown == threshold) {
      engine.add(new Bullet());
      bullet.rewind();
      bullet.play();
      cooldown = 0;
    }
  }

  void recharge() {
    if (cooldown < threshold) cooldown++;
  }
}