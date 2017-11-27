int squares = 23;

int squaresF, row = 0, col = 0, pointA;
float ax, ay, bx, by, cx, cy;
int i,j;

boolean inside_triangle(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
{
  float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
  float alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
  float beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
  float gamma = 1.0 - alpha - beta;

  return !(alpha < 0 || alpha > 1 || beta < 0 || beta > 1 || gamma < 0 || gamma > 1);
}

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
        fill(0, 224, 0);
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

void setup(){
  size(500,500);
  textSize(20);
  //squares = 20;
  squaresF = width/squares;
  pointA = squaresF/2;
  ax = width/4;
  ay = 50;
  bx = width - 11;
  by = 50;
  cx = ((bx-ax)/2)+ax;
  cy = height - 11;
  //noSmooth();
}

void draw(){
  background(224);
  fill(0);
  text("Rasterization",10,20);
  fill(223,22,22);
  drawSquares();
  strokeWeight(2);
  fill(255,255,255,0);
  triangle(ax, ay, bx, by, cx, cy);
  
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