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
  for (i=0; i<sz; i++) key[i]= 'a';
}

void encrypt (char *plaintext, int sz) {
  ciphertext = (char *) (malloc (sz));
  for (i=0; i<sz; i++)
    ciphertext[i]=plaintext[i] ^ key[i];
}

void main (){
  char username[20];
  char text[1024];

  printf("Enter username: ");
  scanf("%19s",username);
  greeter(username);

  printf("Enter text: ");
  scanf("%1023s",text);

  initkey(username, strlen(text));
  encrypt(text, strlen(text));
}
