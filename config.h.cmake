/* ==========================================================
    *** DO NOT MODIFY config.h ***
    Instead modify config.h.cmake, and re-run cmake configure
   ========================================================== */
#ifndef _CONFIG_H_
#define _CONFIG_H_

// For config.h.cmake file
#ifdef _MSC_VER
/////////////////////////////////////////////////////
// Some Windows glue
typedef int mode_t;
#define S_ISREG(a) (a & _S_IFREG)
#define S_ISDIR(a) (a &  _S_IFDIR)
/////////////////////////////////////////////////////
#endif
/* Version number of package - added in CMakeLists.txt */
/* #undef VERSION */

/* Define to 1 if you have the `alarm' function. */
#cmakedefine HAVE_ALARM 1

/* Define to 1 if you have the `btowc' function. */
#cmakedefine HAVE_BTOWC 1

/* Define to 1 if you have the <ctype.h> header file. */
#cmakedefine HAVE_CTYPE_H 1

/* Define to 1 if you have the declaration of `getenv', and to 0 if you don't.
   */
#cmakedefine HAVE_DECL_GETENV 1

/* Define to 1 if you have the <dirent.h> header file, and it defines `DIR'.
   */
#cmakedefine HAVE_DIRENT_H 1

/* Define to 1 if you have the <errno.h> header file. */
#cmakedefine HAVE_ERRNO_H 1

/* Define to 1 if your system has a working POSIX `fnmatch' function. */
#cmakedefine HAVE_FNMATCH 1

/* Define to 1 if you have the <fnmatch.h> header file. */
#cmakedefine HAVE_FNMATCH_H 1

/* Define to 1 if you have the <getopt.h> header file. */
#cmakedefine HAVE_GETOPT_H 1

/* Define to 1 if you have the `getopt_long' function. */
#cmakedefine HAVE_GETOPT_LONG 1

/* Define to 1 if you have the <inttypes.h> header file. */
#cmakedefine HAVE_INTTYPES_H 1

/* Define to 1 if you have the <libintl.h> header file. */
#cmakedefine HAVE_LIBINTL_H 1

/* Define to 1 if you have the <limits.h> header file. */
#cmakedefine HAVE_LIMITS_H 1

/* Define to 1 if you have the `mbsrtowcs' function. */
#cmakedefine HAVE_MBSRTOWCS 1

/* Define to 1 if you have the `memcpy' function. */
#cmakedefine HAVE_MEMCPY 1

/* Define to 1 if you have the `memmove' function. */
#cmakedefine HAVE_MEMMOVE 1

/* Define to 1 if you have the <memory.h> header file. */
#cmakedefine HAVE_MEMORY_H 1

/* Define to 1 if you have the `mempcpy' function. */
#cmakedefine HAVE_MEMPCPY 1

/* Define to 1 if you have the `mkdir' function. */
#cmakedefine HAVE_MKDIR 1

/* Define to 1 if you have the `_mkdir' function. */
#cmakedefine HAVE__MKDIR 1
/* tried to do this in cmake but seems to have failed! */
#if (defined(WIN32) && defined(HAVE_MKDIR) && defined(HAVE__MKDIR))
#undef HAVE_MKDIR
#endif

/* Define to 1 if you have the <ndir.h> header file, and it defines `DIR'. */
#cmakedefine HAVE_NDIR_H 1

/* Define to 1 if you have the <stdarg.h> header file. */
#cmakedefine HAVE_STDARG_H 1

/* Define to 1 if you have the <stdint.h> header file. */
#cmakedefine HAVE_STDINT_H 1

/* Define to 1 if you have the <stdlib.h> header file. */
#cmakedefine HAVE_STDLIB_H 1

/* Define to 1 if you have the `strcasecmp' function. */
#cmakedefine HAVE_STRCASECMP 1

/* Define to 1 if you have the `strchr' function. */
#cmakedefine HAVE_STRCHR 1

/* Define to 1 if you have the <strings.h> header file. */
#cmakedefine HAVE_STRINGS_H 1

/* Define to 1 if you have the <string.h> header file. */
#cmakedefine HAVE_STRING_H 1

/* Define to 1 if you have the <sys/dir.h> header file, and it defines `DIR'.
   */
#cmakedefine HAVE_SYS_DIR_H 1

/* Define to 1 if you have the <sys/ndir.h> header file, and it defines `DIR'.
   */
#cmakedefine HAVE_SYS_NDIR_H 1

/* Define to 1 if you have the <sys/stat.h> header file. */
#cmakedefine HAVE_SYS_STAT_H 1

/* Define to 1 if you have the <sys/time.h> header file. */
#cmakedefine HAVE_SYS_TIME_H 1

/* Define to 1 if you have the <sys/types.h> header file. */
#cmakedefine HAVE_SYS_TYPES_H 1

/* Define to 1 if you have the <unistd.h> header file. */
#cmakedefine HAVE_UNISTD_H 1

/* Define to 1 if you have the `utime' function. */
#cmakedefine HAVE_UTIME 1

/* Define to 1 if you have the `utimes' function. */
#cmakedefine HAVE_UTIMES 1

/* Define to 1 if you have the <utime.h> header file. */
#cmakedefine HAVE_UTIME_H 1

/* Define to 1 if you have the <wchar.h> header file. */
#cmakedefine HAVE_WCHAR_H 1

/* Define to 1 if you have the <wctype.h> header file. */
#cmakedefine HAVE_WCTYPE_H 1

/* Define to 1 if you have the `wmempcpy' function. */
#cmakedefine HAVE_WMEMPCPY 1

/* Define to 1 if you have the `mktime' function. */
#cmakedefine HAVE_MKTIME 1

/* Define to the address where bug reports for this package should be sent. */
#ifndef PACKAGE_BUGREPORT
#define PACKAGE_BUGREPORT "kyzer@4u.net"
#endif

/* Define to the full name of this package. */
#ifndef PACKAGE_NAME
#define PACKAGE_NAME "cabextract"
#endif

/* Define to the full name and version of this package. */
#ifndef PACKAGE_STRING
#define PACKAGE_STRING "cabextract 1.6"
#endif

/* Define to the one symbol short name of this package. */
#ifndef PACKAGE_TARNAME
#define PACKAGE_TARNAME "cabextract"
#endif

/* Define to the home page for this package. */
#ifndef PACKAGE_URL
#define PACKAGE_URL "https://www.cabextract.org.uk/"
#endif

/* Define to the version of this package. */
#ifndef PACKAGE_VERSION
#define PACKAGE_VERSION "1.6"
#endif


// The following failed in this script
#if 0 // 000000000000000000000000000000000000000

/* Define to one of `_getb67', `GETB67', `getb67' for Cray-2 and Cray-YMP
   systems. This function is required for `alloca.c' support on those systems.
   */
/* #undef CRAY_STACKSEG_END */

/* Define to 1 if using `alloca.c'. */
/* #undef C_ALLOCA */

/* Define to 1 if you have `alloca', as a function or macro. */
/* #undef HAVE_ALLOCA */

/* Define to 1 if you have <alloca.h> and it should be used (not on Ultrix).
   */
/* #undef HAVE_ALLOCA_H */

/* Define to 1 if fseeko (and presumably ftello) exists and is declared. */
/* #undef HAVE_FSEEKO */

/* Define to 1 if <wchar.h> declares mbstate_t. */
/* #undef HAVE_MBSTATE_T */

/* Define if mkdir takes only one argument. */
/* #undef MKDIR_TAKES_ONE_ARG */

/* Name of package */
/* #undef PACKAGE */

/* The size of `off_t', as computed by sizeof. */
/* #undef SIZEOF_OFF_T */

/* If using the C implementation of alloca, define if you know the
   direction of stack growth for your system; otherwise it will be
   automatically deduced at runtime.
	STACK_DIRECTION > 0 => grows toward higher addresses
	STACK_DIRECTION < 0 => grows toward lower addresses
	STACK_DIRECTION = 0 => direction of growth unknown */
/* #undef STACK_DIRECTION */

/* Define to 1 if you have the ANSI C header files. */
/* #undef STDC_HEADERS */

/* Define to 1 if you can safely include both <sys/time.h> and <time.h>. */
/* #undef TIME_WITH_SYS_TIME */

/* Number of bits in a file offset, on hosts where this is settable. */
/* #undef _FILE_OFFSET_BITS */

/* Define to 1 to make fseeko visible on some hosts (e.g. glibc 2.2). */
/* #undef _LARGEFILE_SOURCE */

/* Define for large files, on AIX-style hosts. */
/* #undef _LARGE_FILES */

/* Define to empty if `const' does not conform to ANSI C. */
/* #undef const */

/* Define to rpl_fnmatch if the replacement function should be used. */
/* #undef fnmatch */

/* Define to `__inline__' or `__inline' if that's what the C compiler
   calls it, or to nothing if 'inline' is not supported under any name.  */
/* #ifndef __cplusplus
#undef inline
#endif */

/* Define to a type if <wchar.h> does not define. */
/* #undef mbstate_t */

/* Define to `int' if <sys/types.h> does not define. */
/* #undef mode_t */

/* Define to `long int' if <sys/types.h> does not define. */
/* #undef off_t */

/* Define to `unsigned int' if <sys/types.h> does not define. */
/* #undef size_t */

#endif // 000000000000000000000000000000000000000

// Original generated 2017/04/02 17:31:58 UTC, by in2cmake.pl
#endif // _CONFIG_H_
// eof
