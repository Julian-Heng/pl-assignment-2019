#include <stdlib.h>
#include <stdio.h>

#include "tree.h"

#define FREE(ptr) \
    free((ptr)); \
    (ptr) = NULL;


struct node* insert(struct node* node, int value)
{
    if (! node)
    {
        if (! (node = (struct node*)malloc(sizeof(struct node))))
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


struct node* get_last_node(struct node* node)
{
    return node && node->right ? get_last_node(node->right) : node;
}


void print_tree(struct node* node, struct node* last_node)
{
    if (node)
    {
        print_tree(node->left, last_node);
        printf(node == last_node ? "%d" : "%d, ", node->value);
        print_tree(node->right, last_node);
    }
}


void deltree(struct node* node)
{
    if (node)
    {
        deltree(node->left);
        deltree(node->right);
        if (node)
            FREE(node);
    }
}


