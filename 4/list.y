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
program: program list | list;

list:
    | TOKEN_START TOKEN_END TOKEN_TERMINATE
    | TOKEN_START number_list TOKEN_END TOKEN_TERMINATE
    {
        process_list();
    };

number_list: number | number_list TOKEN_SEPERATOR number;
number: TOKEN_NUMBER
    {
        num++;
        insert($1);
    };
%%


void insert(int val)
{
    struct node* new;

    if ((new = (struct node*)malloc(sizeof(struct node))))
    {
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
    else
    {
        fprintf(stderr, "err: Can't malloc node\n");
        exit(1);
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

    if ((array = (int*)malloc(num * sizeof(int))))
    {
        cursor = head;

        // Convert linked list from tokens to array
        do
        {
            array[i] = cursor->val;
        } while ((cursor = cursor->next) && ++i < num);

        // Sort and print
        sort(array, num);

        i = -1;
        while (++i < num)
            printf(! i ? "[%d, " : i < num - 1 ? "%d, " : "%d]\n", array[i]);
    }
    else
    {
        fprintf(stderr, "err: Can't malloc array\n");
        exit(1);
    }

    reset();
}


void sort(int* arr, int length)
{
    // Insertion sort
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


void yyerror(const char *str) { fprintf(stderr, "err: %s\n", str); }
int yywrap() { return 1; }


int main()
{
    reset();
    yyparse();
    yylex_destroy();
}
