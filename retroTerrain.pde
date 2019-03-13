int scl = 20;
float[][] z;
int w = 1200;
int h = 1200;

void setup() {
  size(700, 700, P3D);
  z = new float[w / scl][w / scl + 1];
}


float ystart = 0;

void draw() {
  background(79, 0, 48);
  fill(0, 195, 255);
  pushMatrix();
  translate(width / 2, height / 2 - 100, - 500);
  ellipse(0, 0, 600, 600);
  noStroke();
  fill(79, 0, 48);
  rect(-width / 2, -20, width, 20);
  rect(-width / 2, - 50, width, 10);
  rect(-width / 2, - 80, width, 10);
  rect(-width / 2, - 110, width, 8);
  rect(-width / 2, - 140, width, 6);
  rect(-width / 2, - 170, width, 4);
  rect(-width / 2, - 200, width, 2);
  rect(-width / 2, - 230, width, 1);
  
  //sphere(width / 2 + 20);
  popMatrix();

  float yoff = ystart;
  for (int y = 0; y < z[0].length; y++) {
    float xoff = 0;
    for (int x = 0; x < (z.length - 2) / 2 - 1; x++) {
      int max = (z.length - 2) / 2 - 1;
      float mapScl = map(x, 0, max, 400, 0);
      z[x][y] = map(noise(xoff, yoff), 0, 1, 0, mapScl); 
      xoff += 0.4;
    }
    
    for(int x = (z.length - 2) / 2 + 3; x < z.length; x++){
      int max = z.length;
      float mapScl = map(x, (z.length - 2) / 2 + 3, max, 0, 400);
      z[x][y] = map(noise(xoff, yoff), 0, 1, 0, mapScl); 
      xoff += 0.4;
    }
    yoff += 0.1;
  }
  ystart -= 0.03;

  stroke(255, 0, 212);
  fill(0);

  translate(width / 2, height / 2);
  rotateX(radians(80));
  translate(-w / 2, -h / 3);

  for (int j = 0; j < h / scl; j++) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < w / scl; i++) {
      vertex(i * scl, j * scl, z[i][j]);
      vertex(i * scl, (j + 1) * scl, z[i][j + 1]);
    }
    endShape();
  }
}