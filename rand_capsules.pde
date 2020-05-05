import processing.opengl.*;
import processing.pdf.*;


float randX, randY;


void setup() {
  size(800, 800, P3D);
  beginRecord(PDF, "rand_capsules.pdf");
  background(255);
  smooth(8);
  noFill();
  strokeWeight(0.1);
  stroke(153);
  translate(0, 0);
  scale(10);
  drawCapsules();
}


void draw() {
}


void keyPressed() {
  if (key == ' ') {
    translate(0, 0);
    scale(10);
    background(255);
    drawCapsules();
  } else if (key == 'x') {
    endRecord();
    exit();
  }
}


void drawLine(float fromX, float fromY, float toX, float toY) {
  beginShape(LINES);
  vertex(fromX, fromY);
  vertex(toX, toY);
  endShape();
}


float[] drawTopArc(float r, float startX, float startY) {
  int sdeg = 180;
  int edeg = 360;
  return drawArc(sdeg, edeg, r, startX, startY);
}


float[] drawBottomArc(float r, float startX, float startY) {
  int sdeg = 0;
  int edeg = 180;
  return drawArc(sdeg, edeg, r, startX, startY);
}


float[] drawArc(int sdeg, int edeg, float r, float startX, float startY) {
  float ex = 0;
  float ey = 0;
  beginShape();
  for (int i = sdeg; i <= edeg; i++) {
    float x = r*cos(i*TWO_PI/360);
    float y = r*sin(i*TWO_PI/360);
    curveVertex(x + startX - r, y + startY);
    ex = x + startX - r;
    ey = y + startY;
  }
  endShape();
  float[] ret = {ex, ey};
  return ret;
}


void drawCapsules() {
  int capCount = 30;
  for (int i = 0; i < capCount; i++) {
    randX = random(80);
    randY = random(80);
    float r = 2;
    float straightLen = 10;
    drawLine(randX, randY, randX, randY + straightLen);
    drawLine(randX - 2*r, randY, randX - 2*r, randY + straightLen);
    drawTopArc(r, randX, randY);
    drawBottomArc(r, randX, randY + straightLen);
  }
}
