####This file was automatically created by 'configure.'
####Many variables are set twice -- a generic setting, then 
####a system-specific override at the bottom of the file.
####
# This is a make file inclusion, to be included in all the Netpbm make
# files.

# This file is meant to contain variable settings that customize the
# build for a particular target system configuration.

# The distribution contains the file config.mk.in.  You edit
# config.mk.in in ways relevant to your particular environment 
# to create config.mk.  The "configure" program will do this
# for you in simple cases.

# Some of the variables that the including make file must set for this
# file to work:
#
#  SRCDIR: The directory at the top of the Netpbm source tree.  Note that
#  this is typically a relative directory, and it must be relative to the
#  make file that includes this file.

DEFAULT_TARGET = nonmerge
#DEFAULT_TARGET = merge

# Fiasco has some special requirements that make it fail to compile on
# some systems, and since it isn't very important, just set this to "N"
# and skip it on those systems unless you want to debug it and fix it.
# OpenBSD:
#BUILD_FIASCO = N
BUILD_FIASCO = Y

# The following are commands for the build process to use.  These values
# do not get built into anything.

# The C compiler (including macro preprocessor)
#CC = gcc
# Note that 'cc' is usually an alias for whatever is the main compiler
# on a system, e.g. the GNU Compiler on Linux.
#CC = cc

# The linker.
LD = $(CC)
#LD = ld
#Tru64:
#LD = cc
#LD = gcc 

#If the linker identified above is a compiler that invokes a linker
#(as in 'cc foo.o -o foo'), set LINKERISCOMPILER.  The main difference is
#that we expect a compiler to take linker options in the '-Wl,-opt1,val1'
#syntax whereas the actual linker would take '-opt1 val1'.
LINKERISCOMPILER=Y
#If $(LD) is 'ld':
#LINKERISCOMPILER=N

#LINKER_CAN_DO_EXPLICIT_LIBRARY means the linker specified above can
#take a library as just another link object argument, as in 'ld
#pnmtojpeg.o /usr/local/lib/libjpeg.so ...'  as opposed to requiring a
#-l option as in 'ld pnmtojpeg.o -L/usr/local/lib -l jpeg'.
#This variable controls how 'libopt' gets built.  Note that with some
#linkers, you can specify a shared library explicitly, but then it has
#to live in that exact place at run time.  That's not good enough for us.

LINKER_CAN_DO_EXPLICIT_LIBRARY=N
#GNU:
#LINKER_CAN_DO_EXPLICIT_LIBRARY=Y

# This is the name of the header file that declares the types
# uint32_t, etc.  This name is used as #include $(INTTYPES_H)  .
# Set to null if the types come automatically without including anything.

# We have a report (2005.09.17) that on IRIX 5.3 with the native IDO
# cc, inttypes.h and sys/types.h conflict (and Netpbm programs include
# sys/types for other things), so for that environment, <inttypes.h>
# won't work, but "inttypes_netpbm.h" might.

INTTYPES_H = <inttypes.h>
# Linux libc5:
#INTTYPES_H = <types.h>
# Solaris:
# Solaris has <sys/inttypes.h>, but it doesn't define int_fast2_t, etc.
#INTTYPES_H = "inttypes_netpbm.h"
# Others:
#INTTYPES_H = <sys/stdint.h>
#INTTYPES_H = <sys/types.h>
# The automatically generated Netpbm version:
#INTTYPES_H = "inttypes_netpbm.h"

# HAVE_INT64 tells whether, assuming you include the header indicated by
# INTTYPES_H, you have the int64_t type and related stuff.  (If you don't
# the build will omit certain code that does 64 bit computations).
HAVE_INT64 = Y
#HAVE_INT64 = N

# WANT_SSE tells whether the build should use SSE instructions, via the the
# standard SSE intrinsics (operators such as '_mm_movemask_epi8').  SSE
# instructions are faster than traditional instructions, but aren't available
# on all CPUs.  Also, the standard intrinsics are not available in all
# compilers.  Even if you say N here, Netpbm may still be built with some
# SSE exploitation (e.g. SSE floating point) because the compiler will 
# do it automatically.  You can add a -nomsse or -nomsse2 option to
# CFLAGS or CFLAGS_PERSONAL to stop that.
WANT_SSE = N
#WANT_SSE = Y

# CC and LD are for building the Netpbm programs, which are not necessarily
# intended to run on the same system on which Make is running.  But when we 
# build a build tool such as Libopt, it is meant to run only on the same 
# system on which the Make is running.  The variables below define programs
# to use to compile and link build tools.
CC_FOR_BUILD = $(CC)
LD_FOR_BUILD = $(LD)
CFLAGS_FOR_BUILD = $(CFLAGS) $(CFLAGS_CONFIG)
LDFLAGS_FOR_BUILD = $(LDFLAGS)

# WINDRES is the program that creates a linkable object file from 
# a Windows Icon (.ico) file.
WINDRES = windres

# MAKE is set automatically by Make to what was used to invoke Make.

INSTALL = $(SRCDIR)/buildtools/install.sh
#Solaris:
#INSTALL = /usr/ucb/install
#Tru64:
#INSTALL = installbsd
#OSF1:
#INSTALL = $(SRCDIR)/buildtools/installosf
#Red Hat Linux:
#INSTALL = install

# STRIPFLAG is the option you pass to the above install program to make it
# strip unnecessary information out of binaries.
STRIPFLAG = -s
# If you don't want to strip the binaries, just leave it null:
#STRIPFLAG = 

SYMLINK = ln -s
# At least some Windows environments don't have any concept of symbolic
# links, but direct copies are usually a passable alternative.
#SYMLINK = cp

#MANPAGE_FORMAT is "nroff" or "cat".  It determines in what format the
#pointer man pages are installed (ready to nroff, or ready to cat).  
#A pointer man pages is just a single-paragraph pages that tells you there is
#no man page for the program, to look at the HTML documentation instead.
MANPAGE_FORMAT = nroff
#MANPAGE_FORMAT = cat

AR = ar
RANLIB = ranlib
# IRIX, SCO don't have Ranlib:
#RANLIB = true

# LEX is the beginning of a shell command that runs a Lex-like
# pattern matcher generator.  Null string means there isn't any such
# command.  That means the build will skip parts that need one.

LEX = flex
# Solaris:
# LEX = flex -e
# Windows Mingw:
# LEX =
# 
# LEX = lex

# C compiler options 

# gcc:
# -ansi and -Werror should work too, but are not included
# by default because there's no point in daring the build to fail.
# -pedantic isn't a problem because it causes at worst a warning.
#CFLAGS = -O3 -ffast-math -pedantic -fno-common \
#          -Wall -Wno-uninitialized -Wmissing-declarations -Wimplicit \
#          -Wwrite-strings -Wmissing-prototypes -Wundef -Wno-unknown-pragmas
# The merged programs have a main_XXX subroutine instead of main(),
# which would cause a warning with -Wmissing-declarations or 
# -Wmissing-prototypes.
#CFLAGS_MERGE = -Wno-missing-declarations -Wno-missing-prototypes
# A user of DEC Tru64 4.0F in May 2000 needed -DLONG_32 for ppmtompeg,
# but word size-sensitive code was removed from parallel.c in September 2004.
# A user of Tru64 5.1A in July 2003 needed NOT to have -DLONG_32.  In
# theory, you need this if on your system, long is 32 bits and int is not.
# But it may be completely irrelevant today.
#Tru64:
#CFLAGS = -O2 -std1 -DLONG_32
#CFLAGS = -O2 -std1
#AIX:
#CFLAGS= -O3
#HP-UX:
#CFLAGS= -O3 -fPIC
#IRIX:
#CFLAGS= -n32 -O3
#Amiga with GNU compiler:
#CFLAGS= -m68020-60 -ffast-math -mstackextend 
# You can add -noixemul for Amiga and successfully compile most of the 
# programs.  (Of the remaining ones, if you can supply your own strtod() 
# function, most of them will build with -noixemul).  So try building 
# with 'make --keep-going CADD=-noixemul' first, then just 'make' to build
# everything that failed for lack of the ixemul library in the first step.
# That way, the parts that don't required the ixemul library won't indicate
# a dependency on it.
#OpenBSD:
#CFLAGS = -I/usr/local/include

# EXE is a suffix that the linker puts on any executable it generates.
# In cygwin, this is .exe and most programs deal with its existence without
# us having to know about it.  Some don't though, so set this:

EXE =
#Cygwin, DJGPP/Windows:
#EXE = .exe
  
# linker options.  

# LDFLAGS is often set as an environment variable;  A setting here overrides
# it.  So either make sure you want to override it, or do a "LDFLAGS +=" here.

# LDFLAGS is usually not the right place for a -L option, because we put
# LDFLAGS _before_ our own -L options, so it would cancel out our
# specific selection of libraries.  For example, if you say
# LDFLAGS=/usr/local/lib and an old copy of the libnetpbm is in
# /usr/local/lib, then you'd be linking against that old copy instead of
# the copy you just built, which is located by a -L option later on the
# link command.  LIBS is the right variable for adding -L options.  LIBS
# goes after any of our make files' own -L options.

# Eunice users may want to use -noshare so that the executables can
# run standalone:
#LDFLAGS += -noshare
#Tru64:
# Russ Allberry says on 2001.06.09 that -oldstyle_liblookup may be necessary
# to keep from finding an ancient system libjpeg.so that isn't compatible with
# NetPBM.  Michael Long found that /usr/local/lib is not in the default
# search path, or not soon enough, and he was getting an old libjpeg that
# caused all the jpeg symbol references to be unresolved.  He had installed
# a new libjpeg in /usr/local/lib.
#LDFLAGS += -call_shared -oldstyle_liblookup -L/usr/local/lib
#AIX:
#LDFLAGS += -L /usr/pubsw/lib
#HP-UX:
#LDFLAGS += -Wl,+b,/usr/pubsw/lib
#IRIX:
#LDFLAGS += -n32

# Linker options for created Netpbm shared libraries.

# Here, $(SONAME) resolves to the soname for the shared library being created.
# The following are gcc options.  This works on GNU libc systems.
LDSHLIB = -shared -Wl,-soname,$(SONAME)
# You need -nostart instead of -shared on BeOS.  Though the BeOS compiler is
# ostensibly gcc, it has the -nostart option, which is not mentioned in gcc
# documentation and doesn't exist in at least one non-BeOS installation.
# BeOS doesn't have sonames built in.
#LDSHLIB = -nostart
#LDSHLIB = -G
# Solaris, SunOS with GNU Ld, SCO:
# These systems have no soname option.
#LDSHLIB = -shared
# Solaris with Sun Ld:
#LDSHLIB = -Wl,-Bdynamic,-G,-h,$(SONAME) 
#Tru64:
#LDSHLIB = -shared -expect_unresolved "*"
#IRIX:
#LDSHLIB = -shared -n32
#AIX GNU compiler/linker:
#LDSHLIB = -shared
#AIX Visual Age C:
#LDSHLIB = -qmkshrobj
#Mac OSX:
# According to experiments done by Peter A Crowley in May 2007, if
# libnetpbm goes in a standard place such as /usr/local/lib,
# programs need not be built with libnetpbm's location included.
# But if it goes elsewhere, the link-editor must include the
# location in the executable.  It finds the runtime location by
# looking inside the library.  The information in the library
# comes from the install_name option with which the library was
# built.  It's an alternative to the -rpath option on other systems.
#LDSHLIB=-dynamiclib
#LDSHLIB=-dynamiclib -install_name $(NETPBMLIB_RUNTIME_PATH)/libnetpbm.$(MAJ).dylib

# LDRELOC is the command to combine two .o files (relocateable object files)
# into a single .o file that can later be linked into something else.  NONE
# means no such command is available.

LDRELOC = NONE
# GNU Ld:
# Older GNU Ld misspells the option as --relocateable.  Newer GNU Ld
# correctly spells it --relocatable.  The abbreviation --reloc works on
# both.
#LDRELOC = ld --reloc
#LDRELOC = ld -r


# On older systems, you have to make shared libraries out of position
# independent code, so you need -fpic or fPIC here.  (The rule is: if
# -fpic works, use it.  If it bombs, go to fPIC).  On newer systems,
# it isn't necessary, but can save real memory at the expense of
# execution speed.  Without position independent code, the library
# loader may have to patch addresses into the executable text.  On an
# older system, this would cause a program crash because the loader
# would be writing into read-only shared memory.  But on newer
# systems, the system silently creates a private mapping of the page
# or segment being modified (the "copy on write" phenomenon).  So it
# needs its own private real page frame.  In one experiment, A second
# copy of Pbmtext used 16K less real memory when built with -fpic than
# when built without.  2001.06.02.

# We have seen -fPIC required on IA64 and AMD64 machines (GNU
# compiler/linker).  Build-time linking fails without it.  I don't
# know why -- history seems to be repeating itself.  2005.02.23.

CFLAGS_SHLIB = 
# Gcc:
#CFLAGS_SHLIB = -fpic
#CFLAGS_SHLIB = -fPIC
# Sun compiler:
#CFLAGS_SHLIB = -Kpic
#CFLAGS_SHLIB = -KPIC

# SHLIB_CLIB is the link option to include the C library in a shared library,
# normally "-lc".  On typical systems, this serves no purpose.  On some,
# though, it causes information about which C library to use to be recorded
# in the shared library and thus choose the correct library among several or
# avoid using an incompatible one.  But on some systems, the link fails.
# On 2002.09.30, "John H. DuBois III" <spcecdt@armory.com> reports that on 
# SCO OpenServer, he gets the following error message with -lc:
#
#  -lc; relocations referenced  ;  from file(s) /usr/ccs/lib/libc.so(random.o);
#   fatal error: relocations remain against allocatable but non-writable 
#   section: ; .text

SHLIB_CLIB = -lc
# SCO:
#SHLIB_CLIB =

# On some systems you have to build into an executable the list of
# directories where its dynamically linked libraries can be found at
# run time.  This is typically done with a -R or -rpath linker
# option.  Even on systems that don't require it, you might prefer to do
# that rather than set up environment variables or configuration files
# to tell the system where the libraries are.  A "Y" here means to put
# the directory information in the executable at link time.

NEED_RUNTIME_PATH = N
# Solaris, SunOS, NetBSD, AIX:
#NEED_RUNTIME_PATH = Y

# RPATHOPTNAME is the option you use on the link command to specify
# a runtime search path for a shared library.  It is meaningless unless
# NEED_RUNTIME_PATH is Y.
#RPATHOPTNAME = -rpath

# The following variables tell where your various libraries on which
# Netpbm depends live.  The LIBxxx variable is a full file
# specification of the link library (not necessarily the library used
# at run time).  e.g. "/usr/local/lib/graphics/libjpeg.so".  It usually
# doesn't matter if the library prefix and suffix are right -- you can
# use "lib" and ".so" or ".a" regardless of what your system actually
# uses because these just turn into "-L" and "-l" linker options
# anyway.  ".a" implies a static library for some purposes, though.
# If you don't have the library in question, use a value of NONE for
# LIBxxx and the build will simply skip the programs that require that
# library.  If the library is in your linker's (or the Netpbm build's)
# default search path, leave off the directory part, e.g. "libjpeg.so".

# The xxxHDR_DIR variable is the directory in which the interface
# headers for the library live (e.g. /usr/include).  If they are in your
# compiler's default search path, set this variable to null.

# This is where the Netpbm shared libraries will reside when Netpbm is
# fully installed.  In some configurations, the Netpbm builder builds
# this information into the Netpbm executables.  This does NOT affect
# where the Netpbm installer installs the libraries.  A null value
# means the libraries are in a default search path used by the runtime
# library loader.
NETPBMLIB_RUNTIME_PATH = 
#NETPBMLIB_RUNTIME_PATH = /usr/lib/netpbm

# The TIFF library.  See above.  If you want to build the tiff
# converters, you must have the tiff library already installed.

TIFFLIB = NONE
TIFFHDR_DIR =

#TIFFLIB = libtiff.so
#TIFFHDR_DIR = /usr/include/libtiff
#NetBSD:
#TIFFLIB = $(LOCALBASE)/lib/libtiff.so
#TIFFHDR_DIR = $(LOCALBASE)/include
# OSF, Tru64:
#TIFFLIB = /usr/local1/DEC/lib/libtiff.so
#TIFFHDR_DIR = /usr/local1/DEC/include

# Some TIFF libraries do Jpeg and/or Z (flate) compression and thus any
# program linked with the TIFF library needs a Jpeg and/or Z library.  Some
# TIFF libraries have such library statically linked in, but others need it to
# be linked with the program at link-edit time or dynamically at program load
# time.  Make this 'N' if your TIFF library doesn't need such linking.  As of
# 2005.01, the most usual build of the TIFF library appears to require both.
TIFFLIB_NEEDS_JPEG = Y
TIFFLIB_NEEDS_Z = Y

# The JPEG library.  See above.  If you want to build the jpeg
# converters you must have the jpeg library already installed.

# Tiff files can use JPEG compression, so the Tiff library can reference
# the JPEG library.  If your Tiff library references a dynamic JPEG 
# library, you must specify at least JPEGLIB here, or the Tiff
# converters will not build.  Note that your Tiff library may have the
# JPEG stuff statically linked in, in which case you won't need 
# JPEGLIB in order to build the Tiff converters.

JPEGLIB = NONE
JPEGHDR_DIR =
#JPEGLIB = libjpeg.so
#JPEGHDR_DIR = /usr/include/jpeg
# Netbsd:
#JPEGLIB = ${LOCALBASE}/lib/libjpeg.so
#JPEGHDR_DIR = ${LOCALBASE}/include
# OSF, Tru64:
#JPEGLIB = /usr/local1/DEC/libjpeg.so
#JPEGHDR_DIR = /usr/local1/DEC/include
# Typical:
#JPEGLIB = /usr/local/lib/libjpeg.so
#JPEGHDR_DIR = /usr/local/include
# Don't build JPEG stuff:
#JPEGLIB = NONE


# The PNG library.  See above.  If you want to build the PNG
# converters you must have the PNG library already installed.

# The PNG library, by convention starting around April 2002, gets installed
# with names that include a version number, such as libpng10.a and header
# files in /usr/include/libpng10.  But there is conventionally an unnumbered
# alias (e.g. libpng.a, /usr/include/libpng) for the preferred version.
#
# Recent versions of the library (since some time in the 2002-2006 period)
# have an associated 'libpng-config' that tells how to link it.  The make
# files will use that program if it exists (must be in the PATH).  In that
# case, PNGLIB and PNGHDR_DIR are irrelevant, but PNGVER is still meaningful,
# because the make file runs 'libpng$(PNGVER)-config'.
#
# Even more recent versions have the more modern Pkgconfig database entry
# to tell how to link it.  The make files will try to use that first.
#
# The normal way to choose the libpng the Netpbm build uses from among multiple
# versions on your system is not to mess with the variables below, but rather
# to mess with PKG_CONFIG_PATH or PATH environment variable so that the version
# you want to use appears first in the search path.

PNGLIB = NONE
PNGHDR_DIR =
PNGVER = 
#PNGLIB = libpng$(PNGVER).so
#PNGHDR_DIR = /usr/include/libpng$(PNGVER)
# NetBSD:
#PNGLIB = $(LOCALBASE)/lib/libpng$(PNGVER).so
#PNGHDR_DIR = $(LOCALBASE)/include
# OSF/Tru64:
#PNGLIB = /usr/local1/DEC/lib/libpng$(PNGVER).so
#PNGHDR_DIR = /usr/local1/DEC/include

# The zlib compression library.  See above.  You need it to build
# anything that needs the PNG library (see above).  If you selected
# NONE for the PNG library, it doesn't matter what you specify here --
# it won't get used.
#
# If you have 'libpng-config' (see above), these are irrelevant.

ZLIB = NONE
ZHDR_DIR = 
#ZLIB = libz.so

# The JBIG lossless image compression library (aka JBIG-KIT):

JBIGLIB = $(INTERNAL_JBIGLIB)
JBIGHDR_DIR = $(INTERNAL_JBIGHDR_DIR)

# The Jasper JPEG-2000 image compression library (aka JasPer):
JASPERLIB = $(INTERNAL_JASPERLIB)
JASPERHDR_DIR = $(INTERNAL_JASPERHDR_DIR)
# JASPERDEPLIBS is the libraries (-l options or file names) on which
# The Jasper library depends -- i.e. what you have to link into any
# executable that links in the Jasper library.
JASPERDEPLIBS =
#JASPERDEPLIBS = -ljpeg

# And the Utah Raster Toolkit (aka URT aka RLE) library:

URTLIB = $(BUILDDIR)/urt/librle.a
URTHDR_DIR = $(SRCDIR)/urt

# The X11 library has facilities for talking to an X Window System
# server.  It is required by Pamx.

X11LIB = NONE
X11HDR_DIR =

#X11LIB = /usr/lib/libX11.so
#X11HDR_DIR =

# The Linux SVGA library (Svgalib) is a facility for displaying graphics
# on the Linux console.  It is required by Ppmsvgalib.

LINUXSVGALIB = NONE
LINUXSVGAHDR_DIR = 

#LINUXSVGALIB = /usr/lib/libvga.so
#LINUXSVGAHDR_DIR = /usr/include/vgalib

# WINICON_OBJECT is the object file to bind into all Netpbm executables
# to provide the icon for Windows to use for it.  Null for none.
WINICON_OBJECT =
#WINICON_OBJECT = $(BUILDDIR)/icon/netpbm.o

# If you don't want any network functions, set OMIT_NETWORK to "Y".
# The only thing that requires network functions is the option in
# ppmtompeg to run it on multiple computers simultaneously.  On some
# systems network functions don't work or we haven't figured out how to 
# make them work, or they just aren't worth the effort.  
OMIT_NETWORK =
#DJGPP/Windows, Tru64:
#   (there's some minor header problem that prevents network functions from 
#   building on Tru64 2000.10.06)
#OMIT_NETWORK = Y

# These are -l options to link in the network libraries.  Often, these are
# built into the standard C library, so this can be null.  This is irrelevant
# if OMIT_NETWORK is "Y".

NETWORKLD = 
# Solaris, SunOS:
#NETWORKLD = -lsocket -lnsl
# SCO:
#NETWORKLD = -lsocket, -lresolv

# DONT_HAVE_PROCESS_MGMT is Y if this system doesn't have the usual
# Unix process management stuff - fork, wait, etc.  N for a regular Unix
# system.
DONT_HAVE_PROCESS_MGMT = N

# The following variables are used only by 'make install' (and the
# variants of it).  Paths here don't, for example, get built into any
# programs.

# This is where everything goes when you do 'make package', unless you
# override it by setting 'pkgdir' on the Make command line.
PKGDIR_DEFAULT = /tmp/netpbm

# This is where test results are written when you do 'make check', unless
# you override it by setting 'resultdir' on the Make command line.
RESULTDIR_DEFAULT = /tmp/netpbm-test

# Subdirectory of the package directory ($(pkgdir)) in which man pages
# go.
PKGMANDIR = share/man

# File permissions for installed files.
# Note that on some systems (e.g. Solaris), 'install' can't use the 
# mnemonic permissions - you have to use octal.

# binaries (pbmmake, etc)
INSTALL_PERM_BIN =  755       # u=rwx,go=rx
# shared libraries (libpbm.so, etc)
INSTALL_PERM_LIBD = 755       # u=rwx,go=rx
# static libraries (libpbm.a, etc)
INSTALL_PERM_LIBS = 644       # u=rw,go=r
# header files (pbm.h, etc)
INSTALL_PERM_HDR =  644       # u=rw,go=r
# man pages (pbmmake.1, etc)
INSTALL_PERM_MAN =  644       # u=rw,go=r
# data files (pnmtopalm color maps, etc)
INSTALL_PERM_DATA = 644       # u=rw,go=r

# Specify the suffix that want the man pages to have.

SUFFIXMANUALS1 = 1
SUFFIXMANUALS3 = 3
SUFFIXMANUALS5 = 5

#NETPBMLIBTYPE tells the kind of libraries that will get built to hold the
#Netpbm library functions.  The value is used only in make file tests.
# "unixshared" means a unix-style shared library, typically named like 
# libxyz.so.2.3
NETPBMLIBTYPE = unixshared
# "unixstatic" means a unix-style static library, (like libxyz.a)
#NETPBMLIBTYPE = unixstatic
# "dll" means a Windows DLL shared library
#NETPBMLIBTYPE = dll
# "dylib" means a Darwin/Mac OS shared library
#NETPBMLIBTYPE = dylib

#NETPBMLIBSUFFIX is the suffix used on whatever kind of library is 
#selected above.  All this is used for is to construct library names.
#The make files never examine the actual value.
NETPBMLIBSUFFIX = so

# "a" is the suffix for unix-style static libraries.  It is also
# traditionally used for shared libraries on AIX.  The Visual Age C
# manual says sometimes .so works on AIX, and GNU software for AIX
# 5.1.0 does indeed use it.  In our experiments, it works fine if you
# name the library file explicitly on the link, but isn't in the -l
# search order.  If you name the library explicitly on the link, the
# library must live in exactly the same position at run time, so we
# can't use that.  Therefore, you cannot build both static and shared
# libraries with AIX.  You have to choose.
#NETPBMLIBSUFFIX = a
# For HP-UX shared libraries:
#NETPBMLIBSUFFIX = sl
# Darwin/Mac OS shared library:
#NETPBMLIBSUFFIX = dylib
# Windows shared library:
#NETPBMLIBSUFFIX = dll

#STATICLIB_TOO is "Y" to signify that you want a static library built
#and installed in addition to whatever library type you specified by
#NETPBMLIBTYPE.  If NETPBMLIBTYPE specified a static library,
#STATICLIB_TOO simply has no effect.
#STATICLIB_TOO = Y
STATICLIB_TOO = N

#STATICLIBSUFFIX is the suffix that static libraries have.  It's
#meaningless if you aren't building static libraries.
STATICLIBSUFFIX = a

#SHLIBPREFIXLIST is a blank-delimited list of prefixes that a filename
#of a shared library may have on this system.  Traditionally, it's
#just "lib", as in libc or libnetpbm.  On Windows, though, varying
#prefixes are used when multiple alternative forms of a library are
#available.  The first prefix in this list is what we use to name the
#Netpbm shared libraries.
#
# This variable controls how 'libopt' gets built.
#
SHLIBPREFIXLIST = lib
#Cygwin:
#SHLIBPREFIXLIST = cyg lib

NETPBMSHLIBPREFIX = $(firstword $(SHLIBPREFIXLIST))

#DLLVER is used to version the DLLs built on cygwin or other
#windowsish platforms.  We can't add this to LIBROOT, or we'd
#version the static libs (which is bad).  We can't add this
#at the end of the name (like unix does with so numbers) because
#windows will only load dlls whose name ends in "dll".  So,
#we have this variable, which becomes the end of the library "root" name
#for DLLs only.
#
# This variable controls how 'libopt' gets built.
#
DLLVER =
#Cygwin
#DLLVER = $(NETPBM_MAJOR_RELEASE)

#NETPBM_DOCURL is the URL of the main documentation page for Netpbm.
#This is a directory which contains a file for each Netpbm program,
#library, and file type.  E.g. The documentation for jpegtopnm might be in
#http://netpbm.sourceforge.net/doc/jpegtopnm.html .  This value gets
#installed in the man pages (which say no more than to read the webpage)
#and in the Manweb netpbm.url file.
NETPBM_DOCURL = http://netpbm.sourceforge.net/doc/
#For a system with no web access, but a local copy of the doc:
#NETPBM_DOCURL = file:/usr/doc/netpbm/

# RGB_DB_PATH is where Netpbm looks for the color database when the RGBDEF
# environment variable is not set.  See pm_config_in.h for details.
RGB_DB_PATH = /usr/share/netpbm/rgb.txt:/usr/lib/X11/rgb.txt:/usr/share/X11/rgb.txt:/usr/X11R6/lib/X11/rgb.txt




####Lines above were copied from config.mk.in by 'configure'.
####Lines below were added by 'configure' based on the SOLARIS platform.
DEFAULT_TARGET = nonmerge
NETPBMLIBTYPE=unixshared
NETPBMLIBSUFFIX=so
STATICLIB_TOO=N
NETPBMLIB_RUNTIME_PATH=/usr/lib/amd64
LDSHLIB = -m64 -Wl,-Bdynamic,-G,-h,$(SONAME)
NEED_RUNTIME_PATH = N
#CC = gcc
CFLAGS = -O3 -m64 -ffast-math  -pedantic -fno-common -Wall -Wno-uninitialized -Wmissing-declarations -Wimplicit -Wwrite-strings -Wmissing-prototypes -Wundef -Wno-unknown-pragmas
#RPATHOPTNAME = -R
NETWORKLD = -lsocket -lnsl
LINKERISCOMPILER = Y
CFLAGS_SHLIB += -fPIC
TIFFLIB = libtiff.so
JPEGHDR_DIR = /usr/include/libjpeg8-turbo
JPEGLIB = libjpeg.so
ZLIB = libz.so
NETPBM_DOCURL = http://netpbm.sourceforge.net/doc/
WANT_SSE = Y
INSTALL = install
PNGVER = 16
PNGLIB = libpng$(PNGVER).so
PNGHDR_DIR = /usr/include/libpng$(PNGVER)
