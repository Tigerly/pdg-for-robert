
#include<stdio.h>

int foo(){return 1;}

int goo(){return 2;}

float test(int a, float b){ return 3;}


int main(){

  int x= 0;
  int (*p)(void);
  if(x)
    p = &foo;
  else
    p = &goo;

  p(); // print the called function name
 
  printf("p() = %d\n",p());

  test(2,3.14);

  return 0;
}
