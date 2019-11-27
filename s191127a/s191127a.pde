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
  int d = canx/steps;
  PVector[] vectors = new PVector[steps];

  for (int i = 1; i < steps; i = i+1) {
    float cx = i*d;
    float cy = random(d, cany - d);
    PVector vector = new PVector(cx, cy);
    vectors[i] = vector;
    fill(0);
    ellipse(cx, cy, d, d);
    // to ensure that there is a prev vector
    if (i > 1) {
      for (int vi = 1; vi < i; vi = vi+1) {
        PVector v = vectors[vi];
        noFill();
        bezier(v.x, v.y, width/2, height/2, width/2, height/2, vector.x, vector.y);
      }
    }
  }

  exit();
}
