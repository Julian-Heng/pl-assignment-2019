%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


struct node {
    int val;
    struct node* next;
};

struct node* head = NULL;
struct node* current = NULL;

int num = 0;
int* array = NULL;

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

void reset_state()
{
    struct node* temp;

    num = 0;
    if (array)
    {
        free(array);
        array = NULL;
    }

    if (head)
    {
        while (head)
        {
            temp = head;
            head = head->next;

            free(temp);
            temp = NULL;
        }
    }
}


void sort(int* arr, int length)
{
    int i, j, min, temp;
    for (i = 0; i < length - 1; i++)
    {
        min = i;
        for (j = i + 1; j < length; j++)
            min = arr[j] < arr[min] ? j : min;

        temp = arr[min];
        arr[min] = arr[i];
        arr[i] = temp;
    }
}


void yyerror(const char *str)
{
    fprintf(stderr, "err: %s\n", str);
}


int yywrap()
{
    return 1;
}

int main()
{
    yyparse();
}
%}

%token TOKEN_START TOKEN_NUMBER TOKEN_SEPERATOR TOKEN_END

%%
program: program list | list;

list:
    | TOKEN_START TOKEN_END
    | TOKEN_START number_list TOKEN_END
    {
        struct node* cursor;
        int i = 0;
        if ((array = (int*)malloc(num * sizeof(int))))
        {
            cursor = head;
            while (cursor && i < num)
            {
                array[i++] = cursor->val;
                cursor = cursor->next;
            }

            sort(array, num);
            printf("[");
            for (i = 0; i < num - 1; i++)
                printf("%d, ", array[i]);
            printf("%d]\n", array[num - 1]);
        }
        else
        {
            fprintf(stderr, "err: Can't malloc array\n");
            exit(1);
        }

        reset_state();
    };

number_list: number | number_list TOKEN_SEPERATOR number;
number: TOKEN_NUMBER
    {
        num++;
        insert($1);
    };
%%
