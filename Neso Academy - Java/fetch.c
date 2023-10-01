#include <stdio.h>
#include <stdlib.h>
#include <curl/curl.h>

int main(void) {
  CURL *curl;
  CURLcode res;
  char url[100];

  printf("Enter URL: ");
  scanf("%s", url);

  curl = curl_easy_init();
  if(curl) {
    curl_easy_setopt(curl, CURLOPT_URL, url);
    res = curl_easy_perform(curl);
    if(res != CURLE_OK)
      fprintf(stderr, "curl_easy_perform() failed: %s\n",
              curl_easy_strerror(res));
    curl_easy_cleanup(curl);
  }
  return 0;
}
