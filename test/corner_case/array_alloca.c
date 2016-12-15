#include<stdio.h>

int main(){

  int a[10];

  for(int i = 0; i < 10; i++)
    a[i] = i;

  a[3] = 0;
  a[9] = 0;
 
  printf("%d\n",a[3]);

  return 0;
}
