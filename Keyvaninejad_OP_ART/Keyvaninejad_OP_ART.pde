// Inspired by: https://forum.processing.org/two/discussion/3599/how-to-do-this-op-art-spiral


void setup() {
  
  size(500, 400);
  background(0,0,190);
  noStroke();
  fill(255,0,0);
}
 
void draw() {
  translate(width / 2, height / 2); //moving coordinates to the center of canvas.
  float angle = TWO_PI / 21.0;
  for (float rad = 20.0 ; rad < 400.0 ; /* no inc here */) {
    float s = TWO_PI * rad / 42.0;  // size of square, depends on circumference
    for(int i = 0 ; i < 21 ; i++) { // 21 squares per ring
      rect(0, rad, s, s);
      rotate(angle);
    }
    rotate(angle * .25);  // rings are offset from each other
    rad += .95 * s;  // move out by size
  }
  noLoop();
}
