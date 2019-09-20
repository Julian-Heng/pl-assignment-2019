%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "../tree.h"

int yylex_destroy(void);
void reset(void);

// Globals
struct node* root;
int num;
%}


%token TOKEN_START TOKEN_NUMBER TOKEN_SEPERATOR TOKEN_END TOKEN_TERMINATE
%start program

%%
program
    : program list TOKEN_TERMINATE
    | list TOKEN_TERMINATE
    ;

list
    :
    | TOKEN_START number_list TOKEN_END
    {
        printf("[");
        print_tree(root, get_last_node(root));
        printf("]\n");

        reset();
    }
    ;

number_list
    :
    | number
    | number_list TOKEN_SEPERATOR number
    ;

number
    : TOKEN_NUMBER
    {
        // For every number found, insert to binary tree
        num++;
        root = insert(root, $1);
    }
    ;
%%


void reset()
{
    num = 0;
    if (root)
        deltree(root);
    root = NULL;
}


void yyerror(const char* str) { fprintf(stderr, "err: %s\n", str); reset(); }
int yywrap() { return 1; }


int main()
{
    reset();
    yyparse();
    yylex_destroy();
}
