
 /*

    This test shows how a function parameter is loaded with wrong
    opcode in some cases

    Fix by replacing this statement
    sym_push(sym->v & ~SYM_FIELD, type, VT_LOCAL | VT_LVAL, addr);
    with this
    sym_push(sym->v & ~SYM_FIELD, type, VT_LOCAL | lvalue_type(type->t), addr);

    new version(0.9.26) c67-gen.c gfunc_prolog() around line 2285
    old version(0.9.16) i386-gen-c gfunc_prolog() around line 2890
  */
 void test(unsigned char uch_param)
 {
  char ch;
  unsigned char uch;
  
  //uch_param is loaded from memory with LDBU.D
  uch = uch_param;

  //uch_param is loaded from memory with LDW.D
  //type is lost in cast and should be recovered by the symbols associated register
  //however that information is not stored in the old code
  ch = uch_param;

}

main()
{

}
