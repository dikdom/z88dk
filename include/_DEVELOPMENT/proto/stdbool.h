include(__link__.m4)

#ifndef __STDBOOL_H__
#define __STDBOOL_H__

#define bool        _Bool

#define false       0
#define true        1

#define __bool_true_false_are_defined 1

#ifdef __SCCZ80

// SCCZ80
// does not have a _Bool type

typedef unsigned char _Bool;

#endif

#endif
