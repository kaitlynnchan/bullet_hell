/* 
RECT/RECT COLLISION FUNCTION
Jeff Thompson // v0.9 // November 2011 // www.jeffreythompson.org
Takes 8 arguments:
  + x,y position of object 1 - in this case "you"
  + width and height of object 1 - also "you"
  + x,y position of object 2 - in this case the static rectangle
  + width and height of object 2
  
*/
boolean rectRect(float x1, float y1, float w1, float h1, float x2, float y2, float w2, float h2) {
  
  // test for collision
  if (x1+w1/2 >= x2-w2/2 && x1-w1/2 <= x2+w2/2 && y1+h1/2 >= y2-h2/2 && y1-h1/2 <= y2+h2/2) {
    return true;    // if a hit, return true
  }
  else {            // if not, return false
    return false;
  }
}




/* 
 RECT/BALL COLLISION FUNCTION
 Jeff Thompson // v0.9 // November 2011 // www.jeffreythompson.org
 
 Actually quite a bit harder than it looks!
 Built from an example by Matt Worden (http://vband3d.tripod.com/visualbasic/tut_mixedcollisions.htm)
 
 Takes 7 arguments:
 + x,y position of the first ball - in this case "you"
 + width and height of rect
 + x,y position of the second ball
 + diameter of second ball
 
 */

boolean rectBall(float rx, float ry, float rw, float rh, float bx, float by, float d) {

  // first test the edges (this is necessary if the rectangle is larger
  // than the ball) - do this with the Pythagorean theorem

  // if ball entire width position is between rect L/R sides
  if (bx+d/2 >= rx-rw/2 && bx-d/2 <= rx+rw/2 && abs(ry-by) <= d/2) {
    return true;
  }
  // if not, check if ball's entire height is between top/bottom of the rect
  else if (by+d/2 >= ry-rh/2 && by-d/2 <= ry+rh/2 && abs(rx-bx) <= d/2) {
    return true;
  }

  // if that doesn't return a hit, find closest corner
  // this is really just a point, so we can test if we've hit it 
  // upper-left
  float xDist = (rx-rw/2) - bx;  // same as ball/ball, but first value defines point, not center
  float yDist = (ry-rh/2) - by;
  float shortestDist = sqrt((xDist*xDist) + (yDist * yDist));

  // upper-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry-rh/2) - by;
  float distanceUR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceUR < shortestDist) {  // if this new distance is shorter...
    shortestDist = distanceUR;      // ... update
  }

  // lower-right
  xDist = (rx+rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLR = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLR < shortestDist) {
    shortestDist = distanceLR;
  }

  // lower-left
  xDist = (rx-rw/2) - bx;
  yDist = (ry+rh/2) - by;
  float distanceLL = sqrt((xDist*xDist) + (yDist * yDist));
  if (distanceLL < shortestDist) {
    shortestDist = distanceLL;
  }

  // test for collision
  if (shortestDist < d/2) {  // if less than radius
    return true;             // return true
  }
  else {                     // otherwise, return false
    return false;
  }
}