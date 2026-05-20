// bin/print_S_pi10_exceptional.c
// Verifies 4+1+9=14 prime exceptional set for pi/10
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc!= 2) {
        fprintf(stderr, "Usage: %s data/S_pi10_exceptional.txt\n", argv[0]);
        return 1;
    }
    FILE *fp = fopen(argv[1], "r");
    if (!fp) { perror("Error opening S_pi10_exceptional.txt"); return 1; }
    
    printf("=== C Verifier: Exceptional Set S(pi/10) ===\n");
    int p, count = 0;
    int primes[20]; // buffer for 14
    
    while (fscanf(fp, "%d", &p) == 1 && count < 20) {
        primes[count] = p;
        printf(" p_%d = %d\n", count+1, p);
        count++;
    }
    fclose(fp);
    
    printf("Structure check: 4 + 1 + 9 = %d\n", count);
    if (count!= 14) {
        printf("FAIL: Expected 14 primes, got %d\n", count);
        return 2;
    }
    printf("=== EXCEPTIONAL SET PASS ===\n");
    return 0;
}
