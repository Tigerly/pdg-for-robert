
#define NULL 0

static char username[20];

static char __attribute__((annotate("sensitive"))) password[20];  

int greeter(char *str){
  if(str == NULL) 
   return 1;
  printf("Welcome %s!\n", str);
  return 0;
} 
int encrypt(char *str,int key){
  unsigned int i;
  for(i = 0; i < strlen(str); ++i){
    str[i] = str[i] - key;
  }
  return 0;
}
 
int main(){
  printf("Create your username: \n");
  scanf("%s", username);
  if(greeter(username) == 1) printf("Invalid user!\n");
  else printf("Enter your password: \n");
  scanf("%s", password);
printf("password:%s\n", encrypt(password,5));
  return 0;
}