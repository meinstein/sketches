import processing.svg.*;
import java.util.Date;

void settings() {
  Date d = new Date();
  String name = "../svg/" + d.getTime() / 1000 + ".svg";
  size(1000, 1000, SVG, name);
}

void draw(){
  for (int i = 0; i < width; i = i+10) {
    for (int j = 0; j < height; j = j+10) {
      float ri = random(i, i+10);
      float rj = random(j, j+10);
      line(ri, j, i, rj);
    }
  }

  exit();
}
