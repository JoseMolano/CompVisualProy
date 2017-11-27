 float ax, ay, bx, by, cx, cy, pointA = 10, pointB = 50, axC, ayC, bxC, byC, cxC, cyC;
int i,j;
boolean flag;

boolean inside_triangle(float ax, float ay, float bx, float by, float cx, float cy, float x, float y)
{
  float d = (by - cy) * (ax - cx) + (cx - bx) * (ay - cy);
  float alpha = ((by-cy)*(x-cx)+(cx-bx)*(y-cy)) / d;
  float beta = ((cy-ay)*(x-cx)+(ax-cx)*(y-cy)) / d;
  float gamma = 1.0 - alpha - beta;

  return !(alpha < 0 || alpha > 1 || beta < 0 || beta > 1 || gamma < 0 || gamma > 1);
}

void setup(){
  textSize(20);
  size(500,500);
  ax = width/4;
  ay = 50;
  bx = width - 11;
  by = 50;
  cx = ((bx-ax)/2)+ax;
  cy = height - 11;
}

void draw(){
    if(inside_triangle(ax,ay,bx,by,cx,cy,pointA,pointB)){
      flag = true;  
    } else{
      flag = false;      
    }
  background(0,0,0);
  fill(255);
  text("The edge function",10,30);
  strokeWeight(2);
  fill(10, 204, 0);
  triangle(ax, ay, bx, by, cx, cy);
  axC = ax+100*(ax-ay);
  
  line(ax,ay,bx,by);
  if(flag){
    strokeWeight(1);
    fill(234, 0, 0);
    rect(pointA,pointB,20,20);
  }else{
    strokeWeight(1);
    fill(10, 204, 0);
    rect(pointA,pointB,20,20);
  }
  
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
  if(keyPressed){
    pointA = mouseX;
    pointB = mouseY;

  }
}