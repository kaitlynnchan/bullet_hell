class BasicGun extends Gun {
  BasicGun() {
    threshold = 50;
    cooldown = 0;
  }
}

class MachineGun extends Gun {
  MachineGun() {
    threshold = 10;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && newgun >= 1) {
      engine.add(new Bullet());
      bullet.rewind();
      bullet.play();
      cooldown = 0;
    }
  }
}

//class RayGun extends Gun {
//  RayGun() {
//    threshold = 0;
//    cooldown = 0;
//  }
//  void shoot() {
//    if (cooldown == threshold) {
//      float i = 0;
//      while (i < 1) {
//        engine.add(new Bullet());
//        i++;
//      }
//      cooldown = 0;
//    }
//  }
//}

class vGun extends Gun {
  vGun() {
    threshold = 10;
    cooldown = 0;
  }
  void shoot() {
    if (cooldown == threshold && newgun >= 2) {
      engine.add(new Bullet(2, -13));
      engine.add(new Bullet(-2, -13));
      bullet.rewind();
      bullet.play();
      cooldown = 0;
    }
  }
}

class SprinklerGun extends Gun {
  SprinklerGun() {
    threshold = 5;
    cooldown = 0;
  }
  void shoot() {
    if (cooldown == threshold && newgun >= 3) {
      float i = 0;
      while (i < 15) {
        engine.add(new Bullet(random(-5, 5), random(-5, 5)));
      bullet.rewind();
      bullet.play();
        i++;
      }
      cooldown = 0;
    }
  }
}

//class BlossomGun extends Gun {
//  BlossomGun() {
//    threshold = 30;
//    cooldown = 0;
//  }
//  void shoot() {
//    if (cooldown == threshold) {
//      float i = 0;
//      float i2 = 0;
//      float i3 = 0;
//      float i4 = 0;
//      while (i < 50) {
//        engine.add(new Bullet(random(-5, 5), random(5, -5)));
//        i++;
//      }
//      while (i2 < 50) {
//        engine.add(new Bullet(random(5, -5), random(-5, 5)));
//        i2++;
//      }
//      while (i3 < 50) {
//        engine.add(new Bullet(-5, random(-5, 5)));
//        i3++;
//      }
//      while (i4 < 50) {
//        engine.add(new Bullet(random(-5, 5), -5));
//        i4++;
//      }
//      cooldown = 0;
//    }
//  }
//}

//class BombGun extends Gun {

//  BombGun() {
//    threshold = 50;
//    cooldown = 0;
//  }
//  void shoot() {
//    if (cooldown == threshold) {
//      engine.add(new Bullet(50));
//      cooldown = 0;
//    }
//  }
//}

class ArrowGun extends Gun {

  ArrowGun() {
    threshold = 25;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && newgun >= 5) {
      float i = 0;
      while (i < 50) {
        engine.add(new Bullet(0, -7, myship.x - 1.5));
        engine.add(new Bullet(0, -6, myship.x + 15));
        engine.add(new Bullet(0, -6, myship.x - 15));
        engine.add(new Bullet(0, -5, myship.x + 28.5));
        engine.add(new Bullet(0, -5, myship.x - 28.5));


        engine.add(new Bullet(0, 7, myship.x - 1.5));
        engine.add(new Bullet(0, 6, myship.x + 15));
        engine.add(new Bullet(0, 6, myship.x - 15));
        engine.add(new Bullet(0, 5, myship.x + 28.5));
        engine.add(new Bullet(0, 5, myship.x - 28.5));


        //change from incoming x to incoming y

        engine.add(new Bullet(-7, myship.y - 1.5, true));
        engine.add(new Bullet(-6, myship.y + 15, true));
        engine.add(new Bullet(-6, myship.y - 15, true));
        engine.add(new Bullet(-5, myship.y + 28.5, true));
        engine.add(new Bullet(-5, myship.y - 28.5, true));

        engine.add(new Bullet(7, myship.y - 1.5, true));
        engine.add(new Bullet(6, myship.y + 15, true));
        engine.add(new Bullet(6, myship.y - 15, true));
        engine.add(new Bullet(5, myship.y + 28.5, true));
        engine.add(new Bullet(5, myship.y - 28.5, true));
      bullet.rewind();
      bullet.play();
        i++;
      }

      cooldown = 0;
    }
  }
}

class CircleGun extends Gun {

  CircleGun() {
    threshold = 75;
    cooldown = 0;
  }

  void shoot() {
    if (cooldown == threshold && newgun >= 6) {
      engine.add(new CircleBullet());
      bullet.rewind();
      bullet.play();
      cooldown = 0;
    }
  }
}

//class EnemyGun extends Gun {
//  EnemyGun(){
//    threshold = 5;
//    cooldown = 0;
//  }
//  void shoot(){
//    if(cooldown == threshold) {
//      engine.add(enemy.x, enemy.y, dx, dy, false);
//      cooldown = 0;
//    }
//  }
//}