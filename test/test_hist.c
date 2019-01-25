#include <stdio.h>
#include <stdlib.h>
#include <readline/history.h>
#include <readline/readline.h>



int main(int argc, char const* argv[])
{
  /* char *myexp = "This is history"; */

  using_history();

  add_history("this_is_mike");
  /* free(myexp); */

  return 0;
}




