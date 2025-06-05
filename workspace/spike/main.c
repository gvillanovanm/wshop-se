#include <stdio.h>

float sum(float a, float b);

int main(void) {
  float a = 10;
  float b = 20;
  float r;

  r = sum(a, b);
  printf("r = %f\n", r);

  return 0;
}

float sum(float a, float b) {
  return a+b;
}