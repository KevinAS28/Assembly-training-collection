typedef struct{
 int x;
 int y;
} titik;

int main()
{
titik a[3];
titik b = {10, 20};
titik c = {30, 40};
int i = 0;

//asm ("mov %1, %0\n\t""add $1, %0": "=r" (dst):"r" (src));
int d = a[i].y;
 //int e = d;
 return 0;
}
