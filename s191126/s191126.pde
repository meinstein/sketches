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
  int steps = 100;
  float d = canx/steps;
  float prevcx = 0;
  float prevcy = 0;
  for (float step = d; step < cany-d; step = step + d) {
    float cx = canx - step;
    float cy = random(d, cany - d);
    fill(0);
    ellipse(cx, cy, d, d);
    if ((prevcx != 0) && (step != steps - 1)) {
      noFill();
      bezier(prevcx, prevcy, step + d/2, height/2, step+d, height/2, cx, cy);
    }
    prevcx = cx;
    prevcy = cy;
  }

  exit();
}
