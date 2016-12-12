int foo(int param) {
    int __attribute__((annotate("my annotation"))) var = param;
    return var;
}
