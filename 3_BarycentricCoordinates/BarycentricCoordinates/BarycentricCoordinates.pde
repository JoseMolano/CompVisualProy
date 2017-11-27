
class barycentric
{
  float alpha;
  float beta;
  float gamma;
  String alphaS;
  String betaS;
  String gammaS;

  barycentric()
  {
    alpha = 0.0;
    beta = 0.0;
    gamma = 0.0;
  }

  barycentric(float A, float B, float C)
  {
    alpha = A;
    beta = B;
    gamma = C;
  }

  barycentric(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
  {
    float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
    alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
    beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
    gamma = 1.0 - alpha - beta;
    alphaS = nf(alpha,1,2);
    betaS = nf(beta,1,2);
    gammaS = nf(gamma,1,2);
  }

  float interpolate(float a, float b, float c)
  {
    return a * alpha + b * beta + c * gamma;
  }
}

boolean inside_triangle(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
{
  float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
  float alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
  float beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
  float gamma = 1.0 - alpha - beta;

  return !(alpha < 0 || alpha > 1 || beta < 0 || beta > 1 || gamma < 0 || gamma > 1);
}

float ax;
float ay;
float bx;
float by;
float cx;
float cy;

void setup()
{
  size(500, 500);
  textSize(20);
  colorMode(RGB, 1);

  ax = width/4;
  ay = 50;
  bx = width - 11;
  by = 50;
  cx = ((bx-ax)/2)+ax;
  cy = height - 11;
}

void draw()
{
  background(0);
  
  strokeWeight(1);
  stroke(0);
  fill(1);
  triangle(ax, ay, bx, by, cx, cy);

  barycentric abc = new barycentric(ax, ay, bx, by, cx, cy, mouseX, mouseY);

  textSize(20);
  textAlign(LEFT);
  fill(1);
  text("Barycentric coordinates",10,30);
  fill(1, 0, 0);
  //text("λ0: " + Float.toString(abc.alphaF), 0, 20);
  text("λ0: " + abc.alphaS, 10, 60);
  fill(0, 1, 0);
  text("λ1: " + abc.betaS, 10, 80);
  fill(0, 0, 1);
  text("λ2: " + abc.gammaS, 10, 100);
  fill(1, 1, 1);
  //text("x: " + Float.toString(abc.interpolate(ax, bx, cx)), 0, 80);
  //text("y: " + Float.toString(abc.interpolate(ay, by, cy)), 0, 100);
  //text(abc.alphaS,0,120);
  
  strokeWeight(2);
  if (inside_triangle(ax, ay, bx, by, cx, cy, mouseX, mouseY))
  {
    stroke(0, 0, 0);
    fill(0,0,1);
    triangle(ax,ay,mouseX,mouseY,bx,by);
    fill(1,0,0);
    triangle(bx,by,mouseX,mouseY,cx,cy);
    fill(0,1,0);
    triangle(cx,cy,mouseX,mouseY,ax,ay);

  }
  else
  {
    stroke(1, 0, 0);
  }
  point(mouseX, mouseY);

  if (mousePressed)
  {
    if (mouseButton == LEFT)
    {
      ax = mouseX;
      ay = mouseY;
    }

    if (mouseButton == RIGHT)
    {
      bx = mouseX;
      by = mouseY;
    }

    if (mouseButton == CENTER)
    {
      cx = mouseX;
      cy = mouseY;
    }
  }
}