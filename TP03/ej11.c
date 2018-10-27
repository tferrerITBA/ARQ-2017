#include <stdio.h>

unsigned fibonacci(unsigned);
unsigned fibonacciIter(unsigned);

int main(void) {
	printf("%d\n%d\n", fibonacci(1), fibonacciIter(1));
	return 0;
}
unsigned fibonacci(unsigned n) {
	if(n == 0)
		return 0;
	if(n == 1)
		return 1;
	return fibonacci(n-2) + fibonacci(n-1);
}

unsigned fibonacciIter(unsigned n) {
	unsigned first = 0;
	unsigned last = 1;
	for(; n > 0; n--) {
		unsigned aux = first + last;
		first = last;
		last = aux;
	}
	return first; //para no hacer if(n == 0), hago siempre una suma de mas

}