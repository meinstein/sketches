import processing.svg.*;
import java.util.Date;

void settings() {
  Date d = new Date();
  String name = "./" + d.getTime() / 1000 + ".svg";
  size(800, 800, SVG, name);
}

void draw(){
  int step = 32;
  float p = 0.25;
  for (int x = 0; x < width; x = x+step) {
    for (int y = 0; y < height; y = y+step) {
      // lay down a grid
      //rect(x, y, step, step);
      // draw lines in each quadrent
      line(x, y + random(p, step - p), x + step, y + step * random(p, 1 - p));
      line(x + random(p, step - p), y, x + step * random(p, 1 - p), y + step);
    }
  }

  exit();
}
