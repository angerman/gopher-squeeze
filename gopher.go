package main

/*
#include <stdlib.h>
*/
import "C"

//export squeeze
func squeeze() *C.char {
    return C.CString("squeak!")
}

func main() {}