#ifndef TREE_H
#define TREE_H

struct node
{
    int value;
    struct node* left;
    struct node* right;
};

struct node* insert(struct node*, int);
struct node* get_last_node(struct node*);
void print_tree(struct node*, struct node*);
void deltree(struct node*);

#endif
