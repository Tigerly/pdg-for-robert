#include<stdio.h>
#include<stdlib.h>

int main(int argc, char** argv){
  /*
  int arr[100];
  int num, i, j;

  size_t result = 0;

  for(i = 0; i < 100; i++){
    arr[i] = (i * 100 +2) % 102;
  }

  printf("enter a number\n");
  scanf("%d", &num);

  
  for(j= 0; j< 10000000; j++){
    for(i = 0; i< num; i++){
      result = result + arr[i];
    }
  }
 
  printf("the result is %zd\n", result);
  */

  int num, i, j;
  int* p;

  printf("enter a number:\n");
  scanf("%d", &num);
  
  printf("buffer size = %d\n", sizeof(int)*num);

  p = (int*)malloc(sizeof(int)*num);



  for(i = 0; i < num; i++){
    p[i] = i*10;
    printf("%d ", p[i]);
  }

	p[10000] =3;
  
  printf("\n");

  free(p);



  return 0;
}
