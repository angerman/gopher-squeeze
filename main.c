#include <stdio.h>
#include <stdlib.h>
#include "libgopher.h"

// Define the Gopher structure with a function pointer
typedef struct {
    char* (*squeeze)(void);
} Gopher;

int main() {
    // Instantiate and initialize a gopher object with the function pointer
    Gopher gopher = { .squeeze = squeeze };

    // Call squeeze on the gopher object
    char* squeak = gopher.squeeze();

    printf("The gopher says: %s\n", squeak);

    // Free the memory allocated for the string
    free(squeak);

    return 0;
}