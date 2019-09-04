%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FREE(ptr) \
    free((ptr)); \
    (ptr) = NULL;

struct node
{
    int value;
    struct node* next;
};

int yylex_destroy(void);

void insert(int);
void reset(void);

// Globals
struct node* head;
struct node* tail;

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
        struct node* cursor = head;

        printf("[");
        while (cursor)
        {
            printf("%d", cursor->value);
            cursor = cursor->next;
            if (cursor)
                printf(", ");
        }
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
        // For every number found, insert to linked list
        num++;
        insert($1);
    }
    ;
%%


// Insert values into the sorted list
void insert(int value)
{
    struct node* new;
    struct node* next;
    struct node* prev;

    if (! (new = (struct node*)malloc(sizeof(struct node))))
    {
        fprintf(stderr, "err: Can't malloc node\n");
        exit(1);
    }

    new->value = value;
    new->next = NULL;

    // Empty list
    if (! head && ! tail)
    {
        head = new;
        tail = new;
    }
    else
    {
        // Value is smaller than the smallest value in list
        if (value <= head->value)
        {
            new->next = head;
            head = new;
        }
        // Value is larger than the largest value in list
        else if (value >= tail->value)
        {
            tail->next = new;
            tail = new;
        }
        // Value has to go somewhere in the list
        else
        {
            next = head;

            // Find a value in the list larger than what we're inserting
            while (next && value >= next->value)
            {
                prev = next;
                next = next->next;
            }

            if (prev)
                prev->next = new;
            new->next = next;
        }
    }
}


void reset()
{
    struct node* temp;

    num = 0;
    if (head)
    {
        temp = head;
        while (head)
        {
            temp = head;
            head = head->next;

            FREE(temp);
        }

        head = NULL;
        tail = NULL;
    }
}


void yyerror(const char *str) { fprintf(stderr, "err: %s\n", str); reset(); }
int yywrap() { return 1; }


int main()
{
    reset();
    yyparse();
    yylex_destroy();
}
