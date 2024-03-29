// Stack overflow Assignment -> VULNERABILITY PATCHED
#include <stdio.h>
#include <string.h>
#include <sys/types.h>
#include <stdlib.h>
#include <unistd.h>
#include <iostream>
using namespace std;

#define BUFSIZE 300

using namespace std;

void give_shell()
{
  system("/bin/sh");
}

char *mgets(char *dst) // could also implement a counter in this function that stops when BUFSIZE is reached
{
  char *ptr = dst;
  int ch;
  /* skip leading white spaces */
  while ((ch = getchar()) && (ch == ' ' or ch == '\t'))
    ;

  if ((ch == '\n') or (ch == EOF))
  {
    *ptr = '\0';
    return dst;
  }
  else
    *ptr = ch;

  /* now read the rest until \n or EOF */
  while (true)
  {
    ch = getchar();
    if (ch == '\n' or ch == EOF)
      break;
    *(++ptr) = ch;
  }
  *(++ptr) = 0;
  return dst;
}

void bad()
{
  char buffer[BUFSIZE];
  printf("buffer is at %p\n", buffer);
  cout << "Give me some text: ";
  fflush(stdout); // stream is open after this call

  cin.getline(buffer, 300); // I can call getline instead of mgets to cut off the input stream when 300 bytes is reached
  // mgets(buffer);
  cout << "Acknowledged: " << buffer << " with length " << strlen(buffer) << endl;
  //gets(buffer); // depricated
}

int main(int argc, char *argv[])
{
  bad();
  cout << "Good bye!\n";
  return 0;
}
