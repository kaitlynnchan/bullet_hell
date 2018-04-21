void drawINTRO() {
  image(introbackground, width/2, height/2, width, height);

  //title
  textAlign(CENTER);
  textSize(50);
  fill(white);
  textSize(70);
  text("Bullet Hell", width/2, 250);
  textSize(60);
  text("Play", width/2, 350);
  textSize(50);
  text("Tutorial", width/2, 450);
}

boolean overgun1() {
  if (mouseX >= 570 && mouseX <= 670 && mouseY >= 150 && mouseY <= 250) {
    return true;
  } else {
    return false;
  }
}
boolean overgun2() {
  if (mouseX >= 670 && mouseX <= 770 && mouseY >= 150 && mouseY <= 250) {
    return true;
  } else {
    return false;
  }
}
boolean overgun3() {
  if (mouseX >= 570 && mouseX <= 670 && mouseY >= 270 && mouseY <= 370) {
    return true;
  } else {
    return false;
  }
}
boolean overgun4() {
  if (mouseX >= 670 && mouseX <= 770 && mouseY >= 270 && mouseY <= 370) {
    return true;
  } else {
    return false;
  }
}
boolean overgun5() {
  if (mouseX >= 570 && mouseX <= 670 && mouseY >= 390 && mouseY <= 470) {
    return true;
  } else {
    return false;
  }
}
boolean overgun6() {
  if (mouseX >= 670 && mouseX <= 770 && mouseY >= 390 && mouseY <= 470) {
    return true;
  } else {
    return false;
  }
}

void drawTUTORIAL() {
  //background(black);
  image(background, 950, 0, width, height*2);

  textAlign(CENTER);
  textSize(50);
  fill(white);
  text("Tutorial", width/2, 100);

  //pause button
  fill(white);
  textAlign(LEFT);
  textSize(20);
  text("||", 760, 25);

  //health box
  fill(white);
  stroke(grey);
  strokeWeight(1);
  rectMode(CORNER);
  rect(580, 40, 130, 20);

  //lives meter
  //int c = (int)random(0, 3);
  color[] colors = {
    blue, yellow, red
  };
  fill(colors[c]);
  stroke(colors[c]);
  rectMode(CORNER);
  strokeWeight(1);
  rect(580, 41, healthmeter, 18);
  if (healthmeter >= 65 && healthmeter <= 130) c = 0;
  if (healthmeter >= 30 && healthmeter <= 65) c = 1;
  if (healthmeter >= 0 && healthmeter <= 30) c = 2;
  if (healthmeter == 30) {
    float i = 0;
    while (i < 1) {
      engine.add(new GlowingBall(random(playw), random(playh)));
      i++;
    }
  }

  //score
  fill(white);
  textAlign(RIGHT);
  textSize(32);
  text(enemiesKilled, 715, 115);

  //gun options
  image(gun, 620, 200, 100, 80); 
  image(gun2, 720, 200, 100, 80);
  image(gun3, 620, 320, 100, 80);
  image(gun4, 720, 320, 100, 80);
  image(gun5, 620, 440, 100, 80);
  image(gun6, 720, 440, 100, 80);
  noFill();
  stroke(black);
  strokeWeight(2);
  rectMode(CORNER);
  if (gunmode == 0) {
    selectx = 570;
    selecty = 150;
  }
  if (gunmode == 1) {
    selectx = 670;
    selecty = 150;
  }
  if (gunmode == 2) {
    selectx = 570;
    selecty = 270;
  }
  if (gunmode == 3) {
    selectx = 670;
    selecty = 270;
  }

  if (gunmode == 4) {
    selectx = 570;
    selecty = 390;
  }
  if (gunmode == 5) {
    selectx = 670;
    selecty = 390;
  }
  rect(selectx, selecty, 100, 100);

  if (overgun1()) {
    fill(black, 180);
    noStroke();
    rect(550, 50, 150, 100);
    triangle(600, 150, 650, 150, 625, 175);
    fill(white);
    textSize(12);
    text("Basic Gun", 630, 80);
  }
  if (overgun2()) {
    fill(black, 180);
    noStroke();
    rect(650, 50, 150, 100);
    triangle(700, 150, 750, 150, 725, 175);
    fill(white);
    textSize(12);
    text("Rifle", 730, 80);
    text("500 points to unlock", 795, 120);
  }
  if (overgun3()) {
    fill(black, 180);
    noStroke();
    rect(550, 170, 150, 100);
    triangle(600, 270, 650, 270, 625, 295);
    fill(white);
    textSize(12);
    text("Double Barrel", 680, 200);
    text("1000 points to unlock", 695, 240);
  }
  if (overgun4()) {
    fill(black, 180);
    noStroke();
    rect(650, 170, 150, 100);
    triangle(700, 270, 750, 270, 725, 295);
    fill(white);
    textSize(12);
    text("Sprinkler", 730, 200);
    text("1500 points to unlock", 795, 240);
  }
  if (overgun5()) {
    fill(black, 180);
    noStroke();
    rect(550, 290, 150, 100);
    triangle(600, 390, 650, 390, 625, 415);
    fill(white);
    textSize(12);
    text("Arrow Gun", 680, 320);
  }
  if (overgun6()) {
    fill(black, 180);
    noStroke();
    rect(650, 290, 150, 100);
    triangle(700, 390, 750, 390, 725, 415);
    fill(white);
    textSize(12);
    text("Death Circle", 730, 320);
  }

  tutoriala += 5;
  if (tutoriala >= 175) tutoriala = 175;
  fill(white, tutoriala);
  stroke(white);
  rectMode(CENTER);
  rect(width/2, height/2, 500, 500);
  textAlign(LEFT);
  textSize(20);
  fill(black);
  text("Use 'A', 'S', 'D', and 'W' keys to move", 200, 170);
  text("Press spacebar to shoot", 200, 200);
  text("Use number keys to select the gun", 200, 230);
  text("To unlock guns you must kill a", 200, 260);
  text("certain amount of enemies", 200, 290);
  text("Press 'B' to activate the force feild", 200, 320);
  text("But you can only use it one time", 200, 350);
  text("collet the blue powerup to gain", 200, 380);
  text("more health", 200, 410);
  image(glowingball, 600, 410, 100, 100);
  image(keycontrol, 290, 450, 100, 60);
  image(spacecontrol, 450, 450, 150, 40);
  text("press play to begin", 260, 500);
  textSize(30);
  text("PLAY", 350, 540);
}

void drawPLAY() {
  //background(black);
  image(background, 950, 0, width, height*2);


  if (fade2 == 255) f2 = -3;
  fade2 += f2; 
  if (fade2 <= 0) fade2 = 0;
  fill(white, fade2);
  textAlign(CENTER);
  textSize(30);
  text("Are You Ready", width/2, height/2); 

  //pause button
  fill(white);
  textAlign(LEFT);
  textSize(20);
  text("||", 760, 25);

  //health box
  fill(white);
  stroke(grey);
  strokeWeight(1);
  rectMode(CORNER);
  rect(580, 40, 130, 20);

  //lives meter
  color[] colors = {
    blue, yellow, red
  };
  fill(colors[c]);
  stroke(colors[c]);
  rectMode(CORNER);
  strokeWeight(1);
  rect(580, 41, healthmeter, 18);
  if (healthmeter >= 65 && healthmeter <= 130) c = 0;
  if (healthmeter >= 30 && healthmeter <= 65) c = 1;
  if (healthmeter >= 0 && healthmeter <= 30) c = 2;
  if (healthmeter == 30) {
    float i = 0;
    while (i < 1) {
      engine.add(new GlowingBall(random(playw), random(playh)));
      i++;
    }
  }

  //score
  fill(white);
  textAlign(RIGHT);
  textSize(32);
  text(enemiesKilled, 715, 115);
  
  //score
  fill(white);
  textAlign(RIGHT);
  textSize(32);
  text(boostam, 630, 115);

  //gun options
  image(gun, 620, 200, 100, 80); 
  image(gun2, 720, 200, 100, 80);
  image(gun3, 620, 320, 100, 80);
  image(gun4, 720, 320, 100, 80);
  image(gun5, 620, 440, 100, 80);
  image(gun6, 720, 440, 100, 80);
  noFill();
  stroke(black);
  strokeWeight(2);
  rectMode(CORNER);
  if (gunmode == 0) {
    selectx = 570;
    selecty = 150;
  }
  if (gunmode == 1) {
    selectx = 670;
    selecty = 150;
    if (spacekey && newgun < 1) {
      locked.rewind();
      locked.play();
    }
  }
  if (gunmode == 2) {
    selectx = 570;
    selecty = 270;
    if (spacekey && newgun < 2) {
      locked.rewind();
      locked.play();
    }
  }
  if (gunmode == 3) {
    selectx = 670;
    selecty = 270;
    if (spacekey && newgun < 3) {
      locked.rewind();
      locked.play();
    }
  }
  if (gunmode == 4) {
    selectx = 570;
    selecty = 390;
    if (spacekey && newgun < 4) {
      locked.rewind();
      locked.play();
    }
  }
  if (gunmode == 5) {
    selectx = 670;
    selecty = 390;
    if (spacekey && newgun < 5) {
      locked.rewind();
      locked.play();
    }
  }
  rect(selectx, selecty, 100, 100);

  if (overgun1()) {
    fill(black, 180);
    noStroke();
    rect(550, 50, 150, 100);
    triangle(600, 150, 650, 150, 625, 175);
    fill(white);
    textSize(20);
    text("Basic Gun", 670, 100);
  }
  if (overgun2()) {
    fill(black, 180);
    noStroke();
    rect(650, 50, 150, 100);
    triangle(700, 150, 750, 150, 725, 175);
    fill(white);
    textSize(20);
    text("Rifle", 750, 100);
  }
  if (overgun3()) {
    fill(black, 180);
    noStroke();
    rect(550, 170, 150, 100);
    triangle(600, 270, 650, 270, 625, 295);
    fill(white);
    textSize(20);
    text("Double Barrel", 700, 220);
  }
  if (overgun4()) {
    fill(black, 180);
    noStroke();
    rect(650, 170, 150, 100);
    triangle(700, 270, 750, 270, 725, 295);
    fill(white);
    textSize(20);
    text("Sprinkler", 780, 220);
  }
  if (overgun5()) {
    fill(black, 180);
    noStroke();
    rect(550, 290, 150, 100);
    triangle(600, 390, 650, 390, 625, 415);
    fill(white);
    textSize(20);
    text("Arrow Gun", 680, 340);
  }
  if (overgun6()) {
    fill(black, 180);
    noStroke();
    rect(650, 290, 150, 100);
    triangle(700, 390, 750, 390, 725, 415);
    fill(white);
    textSize(20);
    text("Death Circle", 795, 340);
  }

  if (enemiesKilled <= 0) {           ///<= 500
    message = true;
    f = 3;
    enemiesKilled = 20;
    newgun++;
  }
  if (message) {
    fade += f;
    //f = 3;
    if (fade == 255) f = -3;
    if (fade <= 0) fade = 0;
    fill(white, fade);
    textAlign(CENTER);
    textSize(20);
    text("Unlocked a New Gun", width/2, height/2);
  }
}



void drawPAUSE() {
  textAlign(CENTER);
  textSize(50);
  fill(white);
  text("PAUSE", playw/2, playh/2);
  textSize(25);
  textAlign(LEFT);
  text("Play", 40, 550);
  textAlign(LEFT);
  text("Home", playw - 100, 550);
}

void drawLOSE() {
  background(black);
  fill(white);
  textAlign(CENTER);
  textSize(30);
  text("You have been defeated by the enemy", width/2, playh/2);
  text("Play Again", 675, 550);
}

void drawWIN() {
  background(black);
  fill(white);
  textAlign(CENTER);
  textSize(30);
  text("You have survived the enemy", playw/2, playh/2);
  text("Play Again", 675, 550);
}