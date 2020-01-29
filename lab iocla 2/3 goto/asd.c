#include<stdio.h>
int main()
{
	int a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	int m = 2;
	int l = 0, r = 7;
	while (l <= r) { 
        m = l + (r - l) / 2; 
  
        if (a[m] == x) 
            printf("am gasit numarul\n");  
  
        if (a[m] < x) 
            l = m + 1; 
  
        else
            r = m - 1; 
    }
    printf("nu am gasit numarul");

}