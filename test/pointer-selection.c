#include <stdio.h>
#include <stdlib.h>


int allocstr(int len, char **retptr)
{
  char *p = malloc(len + 1);	/* +1 for \0 */
  if(p == NULL)
    return 0;
  *retptr = p;
  return 1;
}

void showstr(char *str){
  printf("showstr: %s\n", str);
}


int main(){

  int num = 3;

  char ** pp = (char**)malloc(num * sizeof(char*));

  for(int i = 0; i < num; i++){
    if(allocstr(i+3, pp+i) == NULL){
      printf("pp+%d is null pointer!\n",i);
    }
    else
      strcpy(*(pp+i), "abc");
  }

  showstr(pp+2);

  for(int i = 0; i < num; i++){
    printf("%s ", *(pp+i));
    free(*(pp+i));
  }

  printf("\n");

  //  free(pp);

  return 0;
}
