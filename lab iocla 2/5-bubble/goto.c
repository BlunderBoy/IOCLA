#include <stdio.h>
 
int main()
{
  int i, j, swap;
  int n = 8;
  int array[] = {5, 6 ,7 , 2 ,1 , 8, 9, 3};
  i = 0; j = 0;
for1:
  if(i == n - 1)
  {
    goto afisare;
  }
for2:
  if(j < n - i - 1)
  {
        swap = array[j];
        array[j]   = array[j+1];
        array[j+1] = swap;
        j++;
        goto for2;
  }
  i++;
  j = 0;
  if(i != n)
  {
    goto for1;
  }

afisare:
  i = 0;
repeta:
  if(i < n)
  {
    printf("%d\n", array[i]);
    i++;
    goto repeta;
  }

 
  return 0;
}