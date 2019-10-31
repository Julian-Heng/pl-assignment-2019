%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Tree struct
typedef struct tree_node
{
    int value;
    struct tree_node* left;
    struct tree_node* right;
} tree_node;

int yylex_destroy(void);
void reset(void);

// Tree function prototypes
tree_node* insert(tree_node*, int);
tree_node* get_last_node(tree_node*);
void print_tree(tree_node*, tree_node*);
void deltree(tree_node*);

// Globals
static tree_node* root;
%}


%token TOKEN_START TOKEN_NUMBER TOKEN_SEPARATOR TOKEN_END TOKEN_TERMINATE
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
    | number_list TOKEN_SEPARATOR number
    ;

number
    : TOKEN_NUMBER
    {
        // For every number found, insert to binary tree
        root = insert(root, $1);
    }
    ;
%%


tree_node* insert(tree_node* node, int value)
{
    if (! node)
    {
        if (! (node = (tree_node*)malloc(sizeof(tree_node))))
        {
            fprintf(stderr, "err: Can't malloc node\n");
            exit(1);
        }

        node->value = value;
        node->left = NULL;
        node->right = NULL;
    }
    else
    {
        if (value <= node->value)
            node->left = insert(node->left, value);
        else if (value > node->value)
            node->right = insert(node->right, value);
    }

    return node;
}


tree_node* get_last_node(tree_node* node)
{
    return node && node->right ? get_last_node(node->right) : node;
}


void print_tree(tree_node* node, tree_node* last_node)
{
    if (node)
    {
        print_tree(node->left, last_node);
        printf(node == last_node ? "%d" : "%d, ", node->value);
        print_tree(node->right, last_node);
    }
}


void deltree(tree_node* node)
{
    if (node)
    {
        deltree(node->left);
        deltree(node->right);
        free(node);
    }
}

void reset()
{
    if (root)
        deltree(root);
    root = NULL;
}


int yyerror(const char* str) { fprintf(stderr, "err: %s\n", str); reset(); }
int yywrap() { return 1; }


int main()
{
    reset();
    yyparse();
    yylex_destroy();
}
