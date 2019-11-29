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
  int rings = 2;
  for (int r = 0; r < rings; r = r+1) {
    int steps = 100;
    float a = TWO_PI/steps;
    PVector[] vectors = new PVector[steps];
    for (int i = 0; i < steps; i = i+1) {
      float x = width/2 + sin(a*i) * random(canx/3, canx/2);
      float y = height/2 + cos(a*i) * random(cany/3, cany/2);
      PVector vector = new PVector(x, y);
      vectors[i] = vector;
      if (i == steps-1) {
        PVector v = vectors[0];
        line(v.x, v.y, vector.x, vector.y);
      } else if (i > 0) {
        PVector v = vectors[i-1];
        line(v.x, v.y, vector.x, vector.y);
      }
    }
  }
  exit();
}
