#include <stdio.h>

int gv = 5;

int __attribute__((annotate("sensitive"))) gv_s = 2017;

float __attribute__((annotate("sensitive"))) pi = 3.14;


int __attribute__((annotate("sensitive"))) *gtest_1;

//int __attribute__((annotate("sensitive"))) gtest_2 = 2015;

//int __attribute__((annotate("sensitive"))) gtest_3 = 2014;


__attribute__((annotate("sensitive"))) void foo() {
    printf("Run procedure foo()!\n");
}

int add (int a, int b){
  return a+b;
}

int sub (int a, int b){
  return a-b;
}

__attribute__((annotate("sensitive"))) int mult(int a, int b){
  return a*b;
}


int main() {

  int trivial = gv;
  
  int __attribute__((annotate("sensitive"))) var = gv_s;
    
  var = var + pi;

  gtest_1 = &trivial;

  printf("%d\n", *gtest_1);

  foo();

  int prod = 0;
  prod = mult(3, 5);
  printf("prod = %d\n", prod);


  int prod2 = 0;
  prod2 = mult(3, 5);
  printf("prod2 = %d\n", prod2);
  
  return var;
}
