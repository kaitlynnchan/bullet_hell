class Star extends GameObject {
  
  Star(){
    x = random(0, playw);
    y = playy;
    dx = 0;
    dy = random(3, 5);
  }
  
  void show(){
   
  
    fill(white);
    stroke(white);
    rectMode(CENTER);
    rect(x, y, 1, 1); 
  }
  
  void act(){
    x += dx;
    y += dy;
  }
  
  boolean isDead(){
    return y >= playh || y <= playy || x >= playw || x <= playx;
  }
  
}