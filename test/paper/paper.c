#include <stdio.h>
#include <stdlib.h>

char __attribute__((annotate("sensitive"))) *key;
char *ciphertext;
unsigned int i;

void greeter (char *str){
  printf("Welcome %s!\n", str);
}

void initkey (char *username, int sz) {
  key = (char *) (malloc (sz));
  // initialize the key randomly using 
  // username as the seed; code omitted
  for (i=0; i<sz; i++) key[i]= 'p';
}

void encrypt (char *plaintext, int sz) {
  ciphertext = (char *) (malloc (sz));
  for (i=0; i<sz; i++)
    ciphertext[i]=plaintext[i] ^ key[i];
}

void main (){
  char username[20];
  char plaintext[1024];

  printf("Enter username: ");
  scanf("%19s",username);
  greeter(username);

  printf("Enter plaintext: ");
  scanf("%1023s",plaintext);

  initkey(username, strlen(plaintext));
  encrypt(plaintext, strlen(plaintext));
}
