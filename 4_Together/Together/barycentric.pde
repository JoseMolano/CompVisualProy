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