//Testing tccgen.c vstore()
typedef struct
{
    float   f1;
    double  d1;
    int     i1;
} test_st;

test_st h[1];

main()
{
  int i=0;

  test_st *sptr;
  test_st s1;

  sptr = &h[i];

  s1 = h[i];

}
