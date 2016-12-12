#include <stdio.h>

typedef struct{
  int x;
  int y;
}point;

void to_origin(point *ptr){
  ptr->x = 0;
  ptr->y = 0;
}

int main(){
  point pt1 = {2,3};
  point *p = &pt1;
  to_origin(p);

  printf("p->x = %d \np->y = %d\n",p->x,p->y);

  return 0;
}
