#include<stdio.h>
#include<stdlib.h>

char * ReadUserName(void)
{
	char * name = (char *)malloc(sizeof(char)* 30);
	fputs("what's your name? : ", stdout);
	gets(name);
	return name;
}
int main(void)
{
	char * name1 = NULL;
	char * name2 = NULL;
	name1 = ReadUserName();
	puts(name1);
	name2 = ReadUserName();
	puts(name2);

	puts(name1);
	puts(name2);
	free(name1);
	free(name2);
	return 0;
}