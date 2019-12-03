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
  int rings = 20;
  int ringw = 60;
  for (int r = 0; r < rings; r = r+1) {
    int steps = 150;
    float a = TWO_PI/steps;
    PVector[] vectors = new PVector[steps];
    for (int i = 0; i < steps; i = i+1) {
      float x = width/2 + sin(a*i*2) * random(canx/ringw*r, canx/ringw*r*1.05);
      float y = height/2 + cos(a*i*2) * random(cany/ringw*r, cany/ringw*r*1.05);
      PVector vector = new PVector(x, y);
      vectors[i] = vector;
      // ensure there is a previous point to connect to
      // only start on fifth ring - otherwise core is too tight
      if (i > 0 && r > 5) {
        PVector v = vectors[i-1];
        stroke(random(255));
        strokeWeight(random(1, 2));
        noFill();
        float x2 = width/2 + sin(a*i) * random(canx/ringw*r-1, canx/ringw*r*.8);
        float y2 = height/2 + cos(a*i) * random(cany/ringw*r-1, cany/ringw*r*.8);
        float x3 = width/2 + sin(a*i) * random(canx/ringw*r-1, canx/ringw*r*.9);
        float y3 = height/2 + cos(a*i) * random(cany/ringw*r-1, cany/ringw*r*.9);
        bezier(v.x, v.y, x2, y2, x3, y3, vector.x, vector.y);
        // close the loop when on the last step
        if (i == steps-1) {
          PVector firstv = vectors[0];
          bezier(firstv.x, firstv.y, x2, y2, x2, y2, vector.x, vector.y);
        }
      }
    }
  }
  exit();
}
