import processing.svg.*;
import java.util.Date;

int canx = 1000;
int cany = 1000;

void settings() {
  Date d = new Date();
  String svgName = "./" + d.getTime() / 1000 + ".svg";
  size(canx, cany, SVG, svgName);
}

void draw() {
  int rings = 55;
  int ringw = 125;
  for (int r = 0; r < rings; r = r+1) {
    int steps = 300;
    float a = TWO_PI/steps;
    PVector[] vectors = new PVector[steps];
    for (int i = 0; i < steps; i = i+1) {
      float x = width/2 + sin(a*i) * random(canx/ringw*r, canx/ringw*r*1.1);
      float y = height/2 + cos(a*i) * random(cany/ringw*r, cany/ringw*r*1.1);
      PVector vector = new PVector(x, y);
      vectors[i] = vector;
      stroke(random(0, 255));
      strokeWeight(random(1, 7));
      // ensure there is a previous point to connect to
      if (i > 0) {
        PVector v = vectors[i-1];
        line(v.x, v.y, vector.x, vector.y);
        // close the loop when on the last step
        if (i == steps-1) {
          PVector firstv = vectors[0];
          line(firstv.x, firstv.y, vector.x, vector.y);
        }
      }
    }
  }
  exit();
}
