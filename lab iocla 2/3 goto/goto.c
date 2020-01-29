#include<stdio.h>
int main()
{
	int a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	int x = 9;
	int k = 1;
	int m;
	int l = 0, r = 7;
	goto trecere;
trecere:
	if(l <= r) 
	{ 
        m = l + (r - l) / 2; 
  
        if (a[m] == x) 
        {
            printf("am gasit numarul %d\n", x); 
            k = 0; 
        }
  
        if (a[m] < x) 
            l = m + 1; 
  
        if (a[m] >= x) 
            r = m - 1; 
    }
    if(k)
    {
    	goto trecere;
    }
}