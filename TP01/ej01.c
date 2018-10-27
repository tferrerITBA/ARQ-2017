#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define BLOQUE 5
#define FILE_ERROR 3

int
main(int argc, char * args[]) 
{
	int n = 0;
	char c;
	char * string = NULL;
	FILE * fp;
	if(argc > 1)
		fp = fopen(args[1], "r");
	else
		return FILE_ERROR;
	while(!feof(fp)) {
		c = fgetc(fp);
		if(isprint(c)) {
			if((n % BLOQUE) == 0) {
				string = realloc(string, n + BLOQUE);
			}
			string[n++] = c;
		}
		else if((c == 0 || c == '\n') && (n >= 4)) {
			if((n % BLOQUE) == 0) {
				string = realloc(string, n + BLOQUE);
			}
			string[n] = 0;
			printf("%s\n", string);
			free(string);
			string = NULL;
			n = 0;
		}
		else {
			if(string != NULL){
				free(string);
				string = NULL;
			}
			n = 0;
		}
	}
	fclose(fp);
	return 0;
}