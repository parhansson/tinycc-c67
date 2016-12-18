Tiny C Compiler for C67
-----------------------------------------------------------------------
Main goal of this project is to provide a compiler that produces bit by
 bit equal binaries with the version shipped with Dynomotions TCC 
 version based on 0.9.16
 
This is based on released version TCC 0.9.26

#### Current status
Builds the same binaries as the 0.9.16 branch in KMotion software
(But only with -static flag though)

Example

Old version (0.9.16 branch)

`tcc67 -text 8005000 -g -static -nostdinc -I kmotioninstalldir/DSP_KFLOP -o example.out example.c kmotioninstalldir/DSP_KFLOP/DSPKFLOP.out`

New version (0.9.26)

`c67-tcc -g -Wl,-Ttext,8005000 -Wl,--oformat,coff -fcommon -static -nostdlib -nostdinc -I kmotioninstalldir/DSP_KFLOP -o example.out example.c kmotioninstalldir/DSP_KFLOP/DSPKFLOP.out`

#### Features:
Decalare variable in for loop
```C
for(int i=0;i<2;i++){
}
```
Not possible in old version, hence...
```C
int i;
for(i=0;i<2;i++){
}
```
New version seem to be a bit stricter and issues more warnings
and emits errors on missing function prototypes.


#### Configure and build
```
./configure --cross
make c67-tcc
```

### Original Fabrice Bellard readme

```
Tiny C Compiler - C Scripting Everywhere - The Smallest ANSI C compiler
-----------------------------------------------------------------------


Features:
--------

- SMALL! You can compile and execute C code everywhere, for example on
  rescue disks.

- FAST! tcc generates optimized x86 code. No byte code
  overhead. Compile, assemble and link about 7 times faster than 'gcc
  -O0'.

- UNLIMITED! Any C dynamic library can be used directly. TCC is
  heading torward full ISOC99 compliance. TCC can of course compile
  itself.

- SAFE! tcc includes an optional memory and bound checker. Bound
  checked code can be mixed freely with standard code.

- Compile and execute C source directly. No linking or assembly
  necessary. Full C preprocessor included. 

- C script supported : just add '#!/usr/local/bin/tcc -run' at the first
  line of your C source, and execute it directly from the command
  line.

Documentation:
-------------

1) Installation on a i386 Linux host (for Windows read tcc-win32.txt)

   ./configure
   make
   make test
   make install

Alternatively, out-of-tree builds are supported: you may use different
directories to hold build objects, kept separate from your source tree:

   mkdir _build
   cd _build
   ../configure
   make
   make test
   make install

By default, tcc is installed in /usr/local/bin.
./configure --help  shows configuration options.


2) Introduction

We assume here that you know ANSI C. Look at the example ex1.c to know
what the programs look like.

The include file <tcclib.h> can be used if you want a small basic libc
include support (especially useful for floppy disks). Of course, you
can also use standard headers, although they are slower to compile.

You can begin your C script with '#!/usr/local/bin/tcc -run' on the first
line and set its execute bits (chmod a+x your_script). Then, you can
launch the C code as a shell or perl script :-) The command line
arguments are put in 'argc' and 'argv' of the main functions, as in
ANSI C.

3) Examples

ex1.c: simplest example (hello world). Can also be launched directly
as a script: './ex1.c'.

ex2.c: more complicated example: find a number with the four
operations given a list of numbers (benchmark).

ex3.c: compute fibonacci numbers (benchmark).

ex4.c: more complicated: X11 program. Very complicated test in fact
because standard headers are being used ! As for ex1.c, can also be launched
directly as a script: './ex4.c'.

ex5.c: 'hello world' with standard glibc headers.

tcc.c: TCC can of course compile itself. Used to check the code
generator.

tcctest.c: auto test for TCC which tests many subtle possible bugs. Used
when doing 'make test'.

4) Full Documentation

Please read tcc-doc.html to have all the features of TCC.

Additional information is available for the Windows port in tcc-win32.txt.

License:
-------

TCC is distributed under the GNU Lesser General Public License (see
COPYING file).

Fabrice Bellard.
```
