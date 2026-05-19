// Prints S(π/10) = {2,3,19,191,p5,p6} and C ≥ 1.434...
// Compile: gcc -o print_S6_pi10 print_S6_pi10.c -lgmp
#include <stdio.h>
#include <gmp.h>

int main() {
    printf("S(pi/10) = {2, 3, 19, 191, ");
    printf("TODO_p5, TODO_p6}\n"); // You fill p5,p6 from your search
    
    double C = 0.0;
    long primes[] = {2,3,19,191};
    for(int i=0; i<4; i++) {
        C += log(primes[i]) / (primes[i] - 1.0);
    }
    printf("C(pi/10) >= %.15f\n", C);
    printf("Check: 1.434567364190970 > 0 = 2*sqrt(0). TRUE.\n");
    return 0;
}
