struct AA{
  char CAA;
  int CA[30];
};
struct RT {
  char A;
  int B[10][20];
  char C;
};
struct ST {
  int X;
  double Y;
  struct RT Z;
};

int *foo(struct ST *s) {
  return &s[7].Z.B[5][13];
}