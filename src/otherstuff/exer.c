#include <stdio.h>
#include <stdbool.h>
#define NELEMS(x)  (sizeof(x) / sizeof((x)[0]))


bool duplicate(int numbers[], int length, int *duplication) {
	if (numbers == NULL || length <= 0)
	{
		return false;
	}

	for (int i = 0; i < length; ++i)
	{
		if (numbers[i] <0 || numbers[i] > length-1)
		{	
			return false;
		}
	}

	for (int i = 0; i < length; ++i)
	{
		while (numbers[i] != i) {
			if (numbers[i] == numbers[numbers[i]])
			{
				*duplication = numbers[i];
				return true;
			}

			int tem = numbers[i];
			numbers[i] = numbers[numbers[i]];
			numbers[tem] = tem;
		}
	}

	return false;


}

int main() {
	int test[] = {2,3,1,0,2,5,3};
	int duplication = 0;
	bool is = duplicate(test, NELEMS(test), &duplication);

	printf("%s: %d\n", is ? "Yes" : "No", duplication);

   return 0;
}