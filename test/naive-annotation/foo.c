
int gv = 5;

int __attribute__((annotate("sensitive"))) gv_s = 2017;

float __attribute__((annotate("sensitive"))) pi = 3.14;


int __attribute__((annotate("sensitive"))) gtest_1 = 2016;

int __attribute__((annotate("sensitive"))) gtest_2 = 2015;

int __attribute__((annotate("sensitive"))) gtest_3 = 2014;


int main() {

  int trivial = gv;
  
    int __attribute__((annotate("sensitive"))) var = gv_s;
    
    var = var + pi;

    return var;
}
