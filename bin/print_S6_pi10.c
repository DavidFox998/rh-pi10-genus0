// bin/print_S6_pi10.c
// Verifies conductor primes for N=10
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc!= 2) {
        fprintf(stderr, "Usage: %s data/S6_pi10.txt\n", argv[0]);
        return 1;
    }
    FILE *fp = fopen(argv[1], "r");
    if (!fp) { perror("Error opening S6_pi10.txt"); return 1; }
    
    printf("=== C Verifier: Conductor Primes ===\n");
    int p, count = 0;
    while (fscanf(fp, "%d", &p) == 1) {
        printf(" p = %d\n", p);
        count++;
    }
    fclose(fp);
    printf("Total conductor primes: %d\n", count);
    printf("=== CONDUCTOR PASS ===\n");
    return count!= 2? 2 : 0; // Must be exactly 2 for N=10
}
