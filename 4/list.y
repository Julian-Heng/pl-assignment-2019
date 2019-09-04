%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FREE(ptr) \
    free((ptr)); \
    (ptr) = NULL;

struct node
{
    int val;
    struct node* next;
};

int yylex_destroy(void);

void insert(int);
void reset(void);
void process_list(void);
void sort(int*, int);
void swap(int*, int*);

// Globals
struct node* head;
struct node* current;

int num;
int* array;
%}


%token TOKEN_START TOKEN_NUMBER TOKEN_SEPERATOR TOKEN_END TOKEN_TERMINATE

%%
program: program list TOKEN_TERMINATE | list TOKEN_TERMINATE;

list:
    | TOKEN_START TOKEN_END
    | TOKEN_START number_list TOKEN_END
    {
        process_list();
    };

number_list: number | number_list TOKEN_SEPERATOR number;
number: TOKEN_NUMBER
    {
        // For every number found, insert to linked list
        num++;
        insert($1);
    };
%%


void insert(int val)
{
    struct node* new;

    if (! (new = (struct node*)malloc(sizeof(struct node))))
    {
        fprintf(stderr, "err: Can't malloc node\n");
        exit(1);
    }

    new->val = val;
    new->next = NULL;

    if (! head)
    {
        head = new;
        current = head;
    }
    else
    {
        current->next = new;
        current = new;
    }
}


void reset()
{
    struct node* temp;

    num = 0;
    if (array)
        FREE(array);

    if (head)
        while (head)
        {
            temp = head;
            head = head->next;

            FREE(temp);
        }
}


void process_list()
{
    struct node* cursor;
    int i = 0;

    if (! (array = (int*)malloc(num * sizeof(int))))
    {
        fprintf(stderr, "err: Can't malloc array\n");
        exit(1);
    }

    cursor = head;

    // Convert linked list to array
    do
    {
        array[i] = cursor->val;
    } while ((cursor = cursor->next) && ++i < num);

    // Sort and print
    sort(array, num);

    i = -1;

    // Edge case for single element arrays
    if (num == 1)
        printf("[%d]\n", array[0]);
    else
        while (++i < num)
            printf(! i ? "[%d, " : i < num - 1 ? "%d, " : "%d]\n", array[i]);

    reset();
}


// Insertion sort
void sort(int* arr, int length)
{
    int temp, i, j;

    for (i = 1, j = i; i < length; i++, j = i)
        while ((j > 0) && (arr[j - 1] > arr[j]))
        {
            swap(&arr[j], &arr[j - 1]);
            j--;
        }
}


void swap(int* a, int* b)
{
    int temp = *a;
    *a = *b;
    *b = temp;
}


void yyerror(const char *str) { fprintf(stderr, "err: %s\n", str); reset(); }
int yywrap() { return 1; }


int main()
{
    reset();
    yyparse();
    yylex_destroy();
}
