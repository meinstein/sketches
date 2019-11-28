import processing.svg.*;
import java.util.Date;

int canx = 1000;
int cany = 1000;

void settings() {
  Date d = new Date();
  String svgName = "./" + d.getTime() / 1000 + ".svg";
  size(canx, cany, SVG, svgName);
}

int getStroke(int i) {
  if (i%2==0) {
    return 0;
  } else {
    return 255;
  }
}

void draw() {
  int steps = 100;
  float d = TWO_PI/steps;
  PVector[] vectors = new PVector[steps];
  for (int i = 1; i < steps; i = i+1) {
    float x = width/2 + cos(d*i) * random(canx/3, canx/2-d);
    float y = height/2 + sin(d*i) * random(cany/3, cany/2-d);
    PVector vector = new PVector(x, y, random(x, y));
    // save vector
    vectors[i] = vector;
    // ensure that there is a prev vector
    if (i > 1) {
      for (int vi = 1; vi < i; vi = vi+1) {
        PVector v = vectors[vi];
        noFill();
        strokeWeight(random(1, 3));
        stroke(getStroke(i));
        float rand1 = random(0, canx);
        float rand2 = random(0, cany);
        bezier(v.x, v.y, rand1, rand2, rand1, rand2, vector.x, vector.y);
      }
    }
  }
  exit();
}
