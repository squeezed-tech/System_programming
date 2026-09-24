#include <stdio.h>

int main(void)
{
    unsigned int n = 2269503710;
    unsigned int sum = 0;

    while (n > 0) {
        sum += n % 10;
        n /= 10;
    }

    printf("%u\n", sum);

    return 0;
}
