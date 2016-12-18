// fix is in tccgen.c gen_opic around line 1516
main()
{
    int UserData[4];
    int i;
    int a = 1;
    double d;

    //This works out of the box
    ((int*)(&d))[a] = UserData[i];

    //But the next statement does not. a is replaced with a constant of 1

    //Test that int* has 4 bytes (size of int) added to &d
    ((int*)(&d))[1] = UserData[i];
}
