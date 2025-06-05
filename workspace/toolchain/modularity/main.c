int add(int, int);
int mul(int, int);
int div(int, int);
float fml(float, float);

void main(void) {
  int a = 10;
  int b = 20;
  int r = 50;

  // op
  r = add(a,b);
  r = mul(a,b);
  r = div(a,b);
  r = fml((float)a,(float)b);

  return;
}

int add(int a, int b) {
  return a + b;
}

int mul(int a, int b) {
  return a * b;
}

int div(int a, int b) {
  return a / b;  
}

float fml(float a, float b) {
  return a * b;  
}