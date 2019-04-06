#include <stdio.h>
#include <string.h>
int main()
{
 char a[4] = "123";
 char b[4];
 scanf("%s\0", b);
 if (!strcmp(a, b))
 {
  printf("success\n");
 }
 else{
  printf("failed\n");
 }
 return 0;
}
