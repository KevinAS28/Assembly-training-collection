#include <stdio.h>
#include <string.h>

int samestr(char *x, char*y)
{
	if (strlen(x)!=strlen(y))
	{
		return 0;
	}
	for (int i = 0; i < strlen(x); i++)
	{
		if (x[i]!=y[i])
		{
			return 0;
		}
	}
	return 1;
}

int main()
{
	char inp[6];
	char * pass  = "kevin";
	printf("password: ");
	scanf("%s\0", inp);
	if (samestr(pass, inp))
	{
		printf("its right\n");
	}
	else{
		printf("nope\n");
	}
	return 0;
}