#include <urlmon.h>
#include <wininet.h>
#include<stdio.h>
#include<string.h>
#include<windows.h>
#pragma comment (lib, "urlmon.lib")
#pragma comment(lib,"wininet")



int main(void)
{
	int ch,j;
	char tag[200];
	char img[] = "img";
	char post_img[] = "/>\n<link href=";
	char http[] = "http://";
	char imgstr[500];
	int ee = 0, ex = 0, et = 0;
	char es[100];
	char tag_url[] = "https://yande.re/post?page=";
	char pages[10];
	int page = 1;
	int cnt = 0;
	char post_url[] = "https://yande.re/post/show/";
	char temp[] = "post-list-posts";
	char tems[] = "id=";
	char number[10];
	char quoto[] = "TheQuote medium";
	char imgsrc[] = "img src";
	char quott[] = "QuoteSource";
	int tx = 0,tt = 0,ts = 0,tp = 0;
	int num = 0;
	FILE *fp,*fo;
	

	printf("[all to search all]type tag to search : ");
	scanf("%s", &tag);
	fflush(stdin);

	if (!strcmp(tag, "all"))
	{
		DeleteUrlCacheEntry(TEXT("https://yande.re/post"));
		printf("get data of yande.re ... ");
		URLDownloadToFile(NULL, TEXT("https://yande.re/post"), TEXT("processing"), 0, NULL);

		fp = fopen("processing", "r");
		tx = 0; tt = 0; ts = 0;
		while ((ch = fgetc(fp)) != EOF)
		{
			if				(tx>-1 && temp[tx] == ch)			tx++;
			else if		(tx > -1 && temp[tx] != ch)			tx = 0;
			else if		(tx < 0 && tems[-tx - 1] == ch)	tx--;
			else if		(tx < 0 && temp[tx] != ch)			tx = -1;

			if				(ts && tp && tt)								tt--;
			else if		(ts && tp)										{number[6 - tp] = ch; tp--;}
			else if		(ts)													break; 

			if				(tx == 15)										tx = -1;
			else if		(tx == -4)										{tt = 2; ts = 1; tp = 6;}
		}

		number[6 - tp] = 0;
		num = atoi(number)+1;
		fclose(fp);
		printf("  done\n");

		while (num--> 0)
		{
			itoa(num, number, 10);
			strcpy(post_url, "https://yande.re/post/show/");
			strcat(post_url, number);
			printf("processing of  : %d", num);
			HRESULT hr = URLDownloadToFile(NULL, post_url, number, 0, NULL);
			if (SUCCEEDED(hr))
				DeleteUrlCacheEntry(imgstr);
			fp = fopen(number, "r");

			ee = 0; ex = 0; et = 0;
			if (fp != NULL)
			{
				while ((ch = fgetc(fp)) != EOF)
				{
					if (ee < 14 && post_img[ee] == ch)		ee++;
					else if (ee < 14 && post_img[ee] != ch)		ee = 0;

					if (ee == 14 && ex && !et)						{ if (!--ex) et = 1; }
					else if (ee == 14 && !ex && !et)					ex = 2;

					if (et)															imgstr[-1 + et++] = ch;
					if (et && ch == 34)									break;
				}

				imgstr[et - 2] = NULL;
				strcpy(img, number);
				strcat(img, ".jpg");
				fclose(fp);
				remove("proc");
				printf("    downloding image...");
				HRESULT hx = URLDownloadToFile(NULL, imgstr, img, 0, NULL);
				if (SUCCEEDED(hx))
					DeleteUrlCacheEntry(imgstr);

				remove(number);
				printf("    done.\n", num);
			}
		}
	}
	else if (!strcmp(tag, "tum"))
	{//http://kiraharu-21.tumblr.com/post/
		printf("where" );
		scanf("%s", &tag);
		fflush(stdin);
		img[0] = NULL;
		strcpy(imgstr, "http://kiraharu-21.tumblr.com/post/");
		strcat(imgstr, tag);
		printf("get data of %s", imgstr);

		URLDownloadToFile(NULL, TEXT(imgstr), TEXT("processing"), 0, NULL);
		fp = fopen("processing", "r");
		tx = 0; tt = 0; ts = 0; tp = 0; cnt = 0; ee = 0;

		while ((ch = fgetc(fp)) != EOF)
		{
			if (!tt){
				if (tx > -1 && quoto[tx] == ch)			
					tx++;
				else	tx = 0;
				if (tx==16){
					tx = 0; tt = 1;
				}
			}
			else{
				if (tx>-1 && imgsrc[tx] == ch)	tx++;
				else tx = 0;
				
				if (tx == 7)
				{
					tx = 0;  ts = 1;
				}
			}
			if (tt&&ts)
			{
					if (tp){
					imgstr[cnt] = ch;
					cnt++;
					if (cnt > 49){
						remove("processing");
						exit(0);
					}
				}
				if (ch == '"'){
					if (tp){ 
						itoa(ee, es,10);
						strcpy(img, es);
						strcat(img, ".jpg");
						URLDownloadToFile(NULL, imgstr, img, 0, NULL); 
						ee++;
						tp = 0;
					}
					else {
						tp = 1;
						cnt = 0;
					}
				}
			}
		}

	}
	else
	{
		while (page++)
		{
			//https://yande.re/post?page=1&tags=
			strcpy(tag_url, "https://yande.re/post?page=");
			itoa(page-1, pages, 10);
			strcat(tag_url, pages);
			strcat(tag_url, "&tags=");
			strcat(tag_url, tag);
			printf("page: %d \t get data of %s ... \n",page-1, tag);
			HRESULT ht = URLDownloadToFile(NULL, tag_url, TEXT("processing"), 0, NULL);
			if (SUCCEEDED(ht))
				DeleteUrlCacheEntry(imgstr);

			fp = fopen("processing", "r");
			tx = 0; tt = 0; ts = 0; tp = 0; cnt = 0;
			while ((ch = fgetc(fp)) != EOF)
			{
				if				(tx>-1 && temp[tx] == ch)							tx++;
				else if		(tx > -1 && temp[tx] != ch)							tx = 0;
				else if		(tx < 0 && tems[-tx - 1] == ch)					tx--;
				else if		(tx < 0 && temp[tx] != ch)							tx = -1;

				if				(ts && tp && tt)												tt--;
				else if		(ts && tp)														
				{ number[6 - tp] = ch; tp--; }
				else if (ts)
				{
					number[6 - tp] = 0;
					for (j = 0; j < 6; j++)
					{
						if (number[j]>47 && number[j] < 58)
						{
						}
						else
							number[j] = 0;
					}
					num = atoi(number);
					printf("get data of %d", num);
					strcpy(post_url, "https://yande.re/post/show/");
					strcat(post_url, number);

					HRESULT hxx = URLDownloadToFile(NULL, post_url, number, 0, NULL);
					if (SUCCEEDED(hxx))
						DeleteUrlCacheEntry(number);
					fo = fopen(number, "r");

					ee = 0; ex = 0; et = 0;
					while ((ch = fgetc(fo)) != EOF)
					{
						if				(ee < 14 && post_img[ee] == ch)		ee++;
						else if		(ee < 14 && post_img[ee] != ch)		ee = 0;

						if				(ee == 14 && ex && !et)						{ if (!--ex) et = 1; }
						else if		(ee == 14 && !ex && !et)					ex = 2;

						if				(et)															imgstr[-1 + et++] = ch;
						if				(et && ch == 34)									break;
					}

					imgstr[et - 2] = NULL;
					strcpy(img, number);
					strcat(img, ".jpg");
					fclose(fo);
					remove("proc");
					printf("    downloding image...");
					HRESULT hx = URLDownloadToFile(NULL, imgstr, img, 0, NULL);
					if (SUCCEEDED(hx))
						DeleteUrlCacheEntry(imgstr);

					remove(number);
					printf("    done.\n", num);

					if (cnt == 15)			{ fclose(fo); fclose(fp); break; }
					cnt++;	tx = -1; tt = 0; ts = 0; tp = 0;
				}

				if				(tx == 15)														tx = -1;
				else if		(tx == -4)														{ tt = 2; ts = 1; tp = 6; }
			}
		}
	}
}