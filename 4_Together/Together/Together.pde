int squares = 25;
int vertexR = 120;
int vertexG = 120;
int vertexB = 120;

int squaresF = 10, row = 0, col = 0, pointA;
int i,j;

void drawSquares(){
  i = 0;
  j = 0;
  col = 0;
  row = squaresF;
    for(i = 0; i <= squares; i++){
    col = 0;
    for(j = 0; j <= squares; j++){
      strokeWeight(1);
      if(inside_triangle(ax,ay,bx,by,cx,cy,col+pointA,row+pointA)){
        barycentric abc = new barycentric(ax, ay, bx, by, cx, cy, col+pointA, row+pointA);
        fill(vertexR*abc.alpha, vertexG*abc.beta, vertexB*abc.gamma);
        rect(col,row,squaresF,squaresF);
      }
      else{
        fill(255,255,255);
        rect(col,row,squaresF,squaresF);
      }
      strokeWeight(3);
      strokeCap(ROUND);
      fill(0,224,0);
      stroke(153,153,255);
      point(col+pointA,row+pointA);
      stroke(0);
      col += squaresF;     
    }    
    row += squaresF;
  } 
  fill(255,255,255,0);
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
  squaresF = width/squares;
  pointA = squaresF/2;
  size(500, 500);
  textSize(20);
  //colorMode(RGB, 1);

  ax = width/4;
  ay = 50;
  bx = width - 11;
  by = 50;
  cx = ((bx-ax)/2)+ax;
  cy = height - 11;
}

void draw()
{
  background(255);  
  fill(1);
  text("Putting things together",10,16);
  drawSquares();
  strokeWeight(1);
  stroke(0);
  triangle(ax, ay, bx, by, cx, cy);

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