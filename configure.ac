# Disable caching
define([AC_CACHE_LOAD], )
define([AC_CACHE_SAVE], )

# Init
AC_PREREQ(2.59)
AC_INIT([xmlpl], 0.1.4, bugs@xmlpl.org)
AC_CONFIG_SRCDIR([config.h.in])
AC_CONFIG_AUX_DIR(./config)

AM_INIT_AUTOMAKE([nostdinc])
AM_CONFIG_HEADER(config.h)


# Flags
AC_COMPILE_FLAGS


# Tools
AC_PROG_CC
AC_PROG_CPP
AC_PROG_LN_S
AC_LANG_CPLUSPLUS
AC_PROG_CXX
AC_PROG_CXXCPP
AC_PROG_INSTALL
AC_LIBTOOL_DLOPEN
AM_PROG_LIBTOOL


# Headers
AC_HEADER_STDC
AC_CHECK_HEADERS([stdlib.h string.h unistd.h])


# Typedefs, structures, and compiler characteristics
AC_HEADER_STDBOOL
AC_C_CONST
AC_C_INLINE


# Standard library functions
AC_FUNC_ERROR_AT_LINE
AC_FUNC_MALLOC
AC_FUNC_REALLOC
AC_CHECK_FUNCS([strchr strdup])


# Test install -C option
touch install.test
if $INSTALL -C install.test install.test2 >/dev/null 2>/dev/null; then
  INSTALL="${INSTALL} -C"
elif $INSTALL -p install.test install.test2 >/dev/null 2>/dev/null; then
  INSTALL="${INSTALL} -p"
fi
rm -f install.test install.test2


# XmlPL Compiler
AC_CHECK_CONFIG(xmlplcc, $VERSION, , [AC_MSG_ERROR([Required program xmlplcc not found!])])
XMLPLCC=${xmlplcc_PREFIX}/bin/xmlplcc
AC_SUBST(XMLPLCC)


# libxmlpl-cpp-standard
AC_CHECK_CONFIG(libxmlpl_cpp_standard, $VERSION, , [AC_MSG_ERROR([Required library libxmlpl_cpp_standard not found!])])



# Create Makefiles
AC_OUTPUT([Makefile])

echo
echo
echo "   Everything seems to be ok."
echo "Now run 'make' and 'make install'."
echo
echo
