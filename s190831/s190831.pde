import processing.svg.*;
import java.util.Date;

void settings() {
  Date d = new Date();
  String svgName = "./" + d.getTime() / 1000 + ".svg";
  size(800, 800, SVG, svgName);
  String pngName = "./" + d.getTime() / 1000 + ".svg";
  save(pngName);
}

float adjust(float yVal) {
  float halfway = height / 2;
  float randomPoint = random(0, halfway / 2);
  if (yVal > halfway) {
    return yVal - randomPoint;
  } else {
    return yVal + randomPoint;
  }
}

void draw() {
  int offset = 5;
  int step = width / 10;
  for (int x = offset; x < width - random(1, offset); x = x + step) {
    for (int y = offset; y < height - offset; y = y + step) {
      // 1
      float x1 = x;
      float y1 = offset;
      // 2
      float x2 = adjust(y);
      float y2 = adjust(x);
      // 3
      float x3 = adjust(x);
      float y3 = adjust(y);
      // 4
      float x4 = x;
      float y4 = height - offset;

      noFill();
      strokeWeight(random(1, offset));
      bezier(x1, y1, x2, y2, x3, y3, x4, y4);
    }
  }

  exit();
}
