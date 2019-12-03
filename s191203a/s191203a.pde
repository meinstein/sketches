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
    int steps = 300;
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
        stroke(0);
        line(v.x, v.y, vector.x, vector.y);
        if (i > 1) {
          PVector v2 = vectors[i-2];
          line(v2.x, v2.y, vector.x, vector.y);
          if (i > 2) {
            PVector v3 = vectors[i-3];
            line(v3.x, v3.y, vector.x, vector.y);
            // close the loop when on the last step
            if (i == steps-1) {
              PVector firstv = vectors[0];
              stroke(0);
              line(firstv.x, firstv.y, vector.x, vector.y);
            }
          }
        }
      }
    }
  }
  exit();
}
