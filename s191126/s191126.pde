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
  int steps = 10;
  for (int step = 1; step < steps; step = step + 1) {
    ellipse(canx/step, cany/step, 50, 50);
  }

  exit();
}
