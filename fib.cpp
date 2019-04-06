#include <cstdio>
#include <cstdlib>
#include <vector>
int d = 0;
int fib_1(int x, int dari){
	
	if (!x) return 0;
	if (x==1) return 1;
	
	printf("dari %d ke %d dengan nilai (x-1=%d)\n", (dari),(dari)+1, x-1);
	int nilai0 = fib_1(x-1, dari+1);
	printf("dari %d ke %d dengan nilai (x-2=%d)\n", (dari),(dari)+2, x-2);
	int nilai1 = fib_1(x-2, dari+2);
	printf("nilai0: %d\n", nilai0);
	printf("nilai1: %d\n", nilai1);	
	printf("nilai0 + nilai1: %d\n\n", nilai0+nilai1);	
	dari+=3;	
	return nilai0+nilai1;
}	

int fib0(int x){
	if (!x) return 0;
	if (x==1) return 1;
	int nilai0 = fib0(x-1);
	int nilai1 = fib0(x-2);
	return nilai0+nilai1;
}


//TAIL CALL OPTIMATION
//use to reduce RAM and increase performance

int fib1(int x){
	int hasil = 0;
	
}

int main(int args, char**argv){
	int val = atoi(argv[1]);

	//printf("fib_1(%d) : %d\n", val, fib_1(val, d));
	printf("fib0(%d) : %d\n", val, fib0(val));
	printf("fib1(%d) : %d\n", val, fib1(val));
	
	return 0;
	for (int val = 0; val < 10; val++){
	//printf("fib0(%d) : %d\n", val, fib0(val));
	printf("fib1(%d) : %d\n\n", val, fib1(val));		
	}

}