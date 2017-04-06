# cabextract project - 20170406
# CMakeLists.txt, generated gencmake.pl, on 2017/04/06 17:52:57
# For top of CMakeLists.txt file
############################################################
include (CheckFunctionExists)
include (CheckIncludeFile)
############################################################

cmake_minimum_required( VERSION 2.8.8 )

# CMakeScripts or use the ones that come by default with CMake.
# set(CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/CMakeModules ${CMAKE_MODULE_PATH})

project( cabextract )

# The version number.
set( cabex_MAJOR 1 )
set( cabex_MINOR 6 )
set( cabex_POINT 1 )

add_definitions( -DVERSION="${cabex_MAJOR}.${cabex_MINOR}.${cabex_POINT}" )

# Allow developer to select is Dynamic or static library built
set( LIB_TYPE STATIC )  # set default static
option( BUILD_SHARED_LIB "Set ON to build shared Library (DLL)" OFF )


if(CMAKE_COMPILER_IS_GNUCXX)
    set( WARNING_FLAGS -Wall )
endif(CMAKE_COMPILER_IS_GNUCXX)

if (CMAKE_CXX_COMPILER_ID STREQUAL "Clang") 
   set( WARNING_FLAGS "-Wall -Wno-overloaded-virtual" )
endif() 

if(WIN32 AND MSVC)
    # turn off various warnings - none needed in this compile
    set(WARNING_FLAGS "${WARNING_FLAGS} /wd4996")
    # foreach(warning 4244 4251 4267 4275 4290 4786 4305)
    # C4244: '=': conversion from '__int64' to 'long'
    # C4267: 'function': conversion from 'size_t' to 'long',
    foreach(warning 4244 4267)
         set(WARNING_FLAGS "${WARNING_FLAGS} /wd${warning}")
    endforeach()
    set( MSVC_FLAGS "-DNOMINMAX -D_USE_MATH_DEFINES -D_CRT_SECURE_NO_WARNINGS -D_SCL_SECURE_NO_WARNINGS -D__CRT_NONSTDC_NO_WARNINGS" )
    #set( NOMINMAX 1 )
    # to distinguish between debug and release libs
    set( CMAKE_DEBUG_POSTFIX "d" )
else()
    # items for unix
endif()

set( CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${WARNING_FLAGS} ${MSVC_FLAGS} -D_REENTRANT" )
set( CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${WARNING_FLAGS} ${MSVC_FLAGS} -D_REENTRANT" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${MSVC_LD_FLAGS}" )

if(BUILD_SHARED_LIB)
   set(LIB_TYPE SHARED)
   message(STATUS "*** Building DLL library ${LIB_TYPE}")
else()
   message(STATUS "*** Option BUILD_SHARED_LIB is OFF ${LIB_TYPE}")
endif()

############################################################
# for configuration section of CMakeLists.txt
# 24 check_include_file items
check_include_file(ctype.h HAVE_CTYPE_H)
check_include_file(dirent.h HAVE_DIRENT_H)
check_include_file(errno.h HAVE_ERRNO_H)
check_include_file(fnmatch.h HAVE_FNMATCH_H)
check_include_file(getopt.h HAVE_GETOPT_H)
check_include_file(inttypes.h HAVE_INTTYPES_H)
check_include_file(libintl.h HAVE_LIBINTL_H)
check_include_file(limits.h HAVE_LIMITS_H)
check_include_file(memory.h HAVE_MEMORY_H)
check_include_file(ndir.h HAVE_NDIR_H)
check_include_file(stdarg.h HAVE_STDARG_H)
check_include_file(stdint.h HAVE_STDINT_H)
check_include_file(stdlib.h HAVE_STDLIB_H)
check_include_file(strings.h HAVE_STRINGS_H)
check_include_file(string.h HAVE_STRING_H)
check_include_file(sys/dir.h HAVE_SYS_DIR_H)
check_include_file(sys/ndir.h HAVE_SYS_NDIR_H)
check_include_file(sys/stat.h HAVE_SYS_STAT_H)
check_include_file(sys/time.h HAVE_SYS_TIME_H)
check_include_file(sys/types.h HAVE_SYS_TYPES_H)
check_include_file(unistd.h HAVE_UNISTD_H)
check_include_file(utime.h HAVE_UTIME_H)
check_include_file(wchar.h HAVE_WCHAR_H)
check_include_file(wctype.h HAVE_WCTYPE_H)
# 15 check_function_exists items
check_function_exists(alarm HAVE_ALARM)
check_function_exists(btowc HAVE_BTOWC)
check_function_exists(getenv HAVE_DECL_GETENV)
check_function_exists(fnmatch HAVE_FNMATCH)
check_function_exists(getopt_long HAVE_GETOPT_LONG)
check_function_exists(mbsrtowcs HAVE_MBSRTOWCS)
check_function_exists(memcpy HAVE_MEMCPY)
check_function_exists(memmove HAVE_MEMMOVE)
check_function_exists(mempcpy HAVE_MEMPCPY)
check_function_exists(mkdir HAVE_MKDIR)
check_function_exists(_mkdir HAVE__MKDIR)
check_function_exists(strcasecmp HAVE_STRCASECMP)
check_function_exists(strchr HAVE_STRCHR)
check_function_exists(utime HAVE_UTIME)
check_function_exists(utimes HAVE_UTIMES)
check_function_exists(wmempcpy HAVE_WMEMPCPY)
check_function_exists(mktime HAVE_MKTIME)

if (WIN32)
    # cmake seems to find BOTH, so
    if (HAVE_MKDIR AND HAVE__MKDIR)
        unset(HAVE_MKDIR)
    else ()
        #add_definitions( -DHAVE__MKDIR ) # maybe NOT required
    endif ()
endif ()

############################################################
### utility library
# cabex LIBRARY from [F:\Projects\cabextract-1.4],
# have 5 C/C++ sources, 3 headers
set(name util_lib)
set(dir cabextract/utils)
include_directories( ${dir} )
set(${name}_SRCS
    ${dir}/md5.c
    )
set(${name}_HDRS
    ${dir}/md5.h
    )
if (NOT HAVE_FNMATCH_H)
    list(APPEND ${name}_SRCS ${dir}/fnmatch.c)
    list(APPEND ${name}_HDRS ${dir}/fnmatch.h)
    set(HAVE_FNMATCH_H 1)
endif ()
if (NOT HAVE_GETOPT_H)
    list(APPEND ${name}_SRCS ${dir}/getopt.c ${dir}/getopt1.c)
    list(APPEND ${name}_HDRS ${dir}/getopt.h)
    set(HAVE_GETOPT_H 1)
endif ()
if (NOT HAVE_DIRENT_H)
    list(APPEND ${name}_SRCS ${dir}/dirent.c)
    list(APPEND ${name}_HDRS ${dir}/dirent.h)
    set(HAVE_DIRENT_H 1)
endif ()
if (NOT HAVE_MKTIME)
    list(APPEND ${name}_SRCS ${dir}/mktime.c)
endif ()
add_library( ${name} ${${name}_SRCS} ${${name}_HDRS} )
list(APPEND add_LIBS ${name})
message(STATUS "*** add_library( ${name} ${${name}_SRCS} ${${name}_HDRS} )")
# deal with install, if any...
#install( TARGETS ${name} DESTINATION bin )

configure_file( ${CMAKE_SOURCE_DIR}/config.h.cmake ${CMAKE_BINARY_DIR}/config.h )
include_directories( ${CMAKE_BINARY_DIR} )
add_definitions( -DHAVE_CONFIG_H )
############################################################

# Total libs 2, exes 3
#################################################
##### LIBRARIES 2 #####
#################################################

# mspack LIBRARY from [libmspack\mspack],
# have 24 C/C++ sources, 18 headers
set(name mspack)
set(dir libmspack/mspack)
include_directories( ${dir} )
#     ${dir}/debug.c
set(${name}_SRCS
    ${dir}/cabc.c
    ${dir}/cabd.c
    ${dir}/chmc.c
    ${dir}/chmd.c
    ${dir}/crc32.c
    ${dir}/hlpc.c
    ${dir}/hlpd.c
    ${dir}/kwajc.c
    ${dir}/kwajd.c
    ${dir}/litc.c
    ${dir}/litd.c
    ${dir}/lzssd.c
    ${dir}/lzxc.c
    ${dir}/lzxd.c
    ${dir}/mszipc.c
    ${dir}/mszipd.c
    ${dir}/oabc.c
    ${dir}/oabd.c
    ${dir}/qtmc.c
    ${dir}/qtmd.c
    ${dir}/system.c
    ${dir}/szddc.c
    ${dir}/szddd.c
    )
set(${name}_HDRS
    ${dir}/cab.h
    ${dir}/chm.h
    ${dir}/crc32.h
    ${dir}/des.h
    ${dir}/hlp.h
    ${dir}/kwaj.h
    ${dir}/lit.h
    ${dir}/lzss.h
    ${dir}/lzx.h
    ${dir}/mspack.h
    ${dir}/mszip.h
    ${dir}/oab.h
    ${dir}/qtm.h
    ${dir}/readbits.h
    ${dir}/readhuff.h
    ${dir}/sha.h
    ${dir}/system.h
    ${dir}/szdd.h
    )
add_library( ${name} ${${name}_SRCS} ${${name}_HDRS} )
list(APPEND add_LIBS ${name})
# deal with install, if any...
#install( TARGETS ${name}
#    RUNTIME DESTINATION bin
#    LIBRARY DESTINATION lib
#    ARCHIVE DESTINATION lib )
#install(FILES ${${name}_HDRS} DESTINATION include)

#################################################
##### EXECUTABLE 3 #####
#################################################

# tester EXECUTABLE from [libmspack\test],
# have 13 C/C++ sources, 3 headers
if (ADD_TEST_EXES)
    set(name tester)
    set(dir libmspack/test)
    set(${name}_SRCS
        ${dir}/cabd_md5.c
        ${dir}/cabd_memory.c
        ${dir}/cabd_test.c
        ${dir}/cabrip.c
        ${dir}/chmd_find.c
        ${dir}/chmd_md5.c
        ${dir}/chmd_order.c
        ${dir}/chminfo.c
        ${dir}/chmx.c
        ${dir}/expand.c
        ${dir}/md5.c
        ${dir}/multifh.c
        ${dir}/oabx.c
        )
    set(${name}_HDRS
        ${dir}/error.h
        ${dir}/md5.h
        ${dir}/md5_fh.h
        )
    add_executable( ${name} ${${name}_SRCS} ${${name}_HDRS} )
    if (add_LIBS)
        target_link_libraries( ${name} ${add_LIBS} )
    endif ()
    if (MSVC)
        set_target_properties( ${name} PROPERTIES DEBUG_POSTFIX d )
    endif ()
    # deal with install, if any...
    #install( TARGETS ${name} DESTINATION bin )
endif ()

# src EXECUTABLE from [cabextract\src],
# have 2 C/C++ sources, 0 headers
set(name cabextract)
set(dir cabextract/src)
set(${name}_SRCS
    ${dir}/cabextract.c
    )
add_executable( ${name} ${${name}_SRCS} )
if (add_LIBS)
    target_link_libraries( ${name} ${add_LIBS} )
endif ()
if (MSVC)
    set_target_properties( ${name} PROPERTIES DEBUG_POSTFIX d )
endif ()
# deal with install, if any...
#install( TARGETS ${name} DESTINATION bin )

# src EXECUTABLE from [cabextract\src],
# have 2 C/C++ sources, 0 headers
set(name cabinfo)
set(dir cabextract/src)
set(${name}_SRCS
    ${dir}/cabinfo.c
    )
add_executable( ${name} ${${name}_SRCS} )
if (add_LIBS)
    target_link_libraries( ${name} ${add_LIBS} )
endif ()
if (MSVC)
    set_target_properties( ${name} PROPERTIES DEBUG_POSTFIX d )
endif ()
# deal with install, if any...
#install( TARGETS ${name} DESTINATION bin )

# eof
