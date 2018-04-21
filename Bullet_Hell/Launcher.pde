class Launcher extends GameObject {
  float xoff;
  Launcher() {
    x = random(0, width);
    y = -50;
    dx = 3;
    dy = 0;
    xoff = random(0, 100);
    w = 60;
    h = 60;
  }
  void show() {
    fill(grey);
    stroke(grey);
    ellipse(x, y, w, h);
  }

  void act() {
    if (mode == PLAY && frameCount < 100) {
    } else if (mode == PLAY && frameCount < 300) {
      straightline(playw/2);
    } else if (mode == PLAY && frameCount < 800) {
      zigzag();
    } else if (mode == PLAY && frameCount < 1300) {
      doubleline();
    } else if (mode == PLAY && frameCount < 1800) {
      heartline();
    } else if (mode == PLAY && frameCount < 2300) {
      noiseline();
    } else if (mode == PLAY && frameCount < 2301) {
      BossOne();
    } else if (mode == PLAY && frameCount < 2800 && enemyhealth <= 0) {
      mode = WIN;
    } 
  }

  void straightline(float incomingx) {
    if (frameCount %15 == 0) {
      x = incomingx;//width/2
      engine.add(new Enemy(x, y, 1));
    }
  }

  void zigzag() {
    x += dx;
    y += dy;
    if (x + 15 >= playw) dx = -3;
    if (x - 15 <= playx) dx = 3;
    if (frameCount %15 == 0) {
      engine.add(new Enemy(x, y, 1));
    }
  }

  void doubleline() {
    if (frameCount %15 == 0) {
      x = playw/2 + 100;
      engine.add(new Enemy(x, y, 1));  
      x = playw/2 - 100;
      engine.add(new Enemy(x, y, 1));
    }
  }

  void heartline() {
    if (frameCount %15 == 0) {
      //y = -50;
      y -= 50;
      x = playw/2;
      engine.add(new EnemyLevelTwo(x, y, 1));// + 105
    }
    if (frameCount %15 == 0) {
      //y = -100;
      y -= 50;
      x = playw/2 + 50;
      engine.add(new EnemyLevelTwo(x, y, 1));
      x = playw/2 - 50;
      engine.add(new EnemyLevelTwo(x, y, 1));
    }
    if (frameCount %15 == 0) {
      //y = -150;
      y -= 50;
      x = playw/2 + 100;
      engine.add(new EnemyLevelTwo(x, y, 1));
      x = playw/2 - 100;
      engine.add(new EnemyLevelTwo(x, y, 1));
    }
    if (frameCount %15 == 0) {
      //y = -200;
      y -= 50;
      x = playw/2 + 50;
      engine.add(new EnemyLevelTwo(x, y, 1));
      x = playw/2 - 50;
      engine.add(new EnemyLevelTwo(x, y, 1));
    }
    if (frameCount %15 == 0) {
      y += 50;
      x = playw/2;
      engine.add(new EnemyLevelTwo(x, y, 1));
      x = playw/2;
      engine.add(new EnemyLevelTwo(x, y, 1));
    }
  }

  void noiseline() {
    if (frameCount %15 == 0) {
      x = noise(xoff) * playw;
      xoff += 0.1;
      engine.add(new Enemy(x, y, 5));
      x = noise(xoff) * playw;
      xoff += 0.01;
      engine.add(new Enemy(x, y, 5));
    }
  }

  void BossOne() {
    if (frameCount %100 == 0) {
      x = playw/2;
      engine.add(new BossLevelOne(x, y, 100));
    }
  }


  boolean isDead() {
    return false;
  }
}