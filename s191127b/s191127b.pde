import processing.svg.*;
import java.util.Date;

int canx = 800;
int cany = 800;

void settings() {
  Date d = new Date();
  String svgName = "./" + d.getTime() / 1000 + ".svg";
  size(canx, cany, SVG, svgName);
}

void draw() {
  int steps = 50;
  float d = TWO_PI/steps;
  PVector[] vectors = new PVector[steps];
  for (int i = 1; i < steps; i = i+1) {
    float cx = width/2 + cos(d*i) * random(canx/3, canx/2-d);
    float cy = height/2 + sin(d*i) * random(cany/3, cany/2-d);
    PVector vector = new PVector(cx, cy);
    vectors[i] = vector;
    // to ensure that there is a prev vector
    if (i > 1) {
      for (int vi = 1; vi < i; vi = vi+1) {
        PVector v = vectors[vi];
        noFill();
        stroke(0, 0.5);
        bezier(v.x, v.y, width/2, height/2, width/2, height/2, vector.x, vector.y);
      }
    }
  }
  exit();
}
