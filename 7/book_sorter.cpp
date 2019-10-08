#include <iostream>
#include <limits>

#include "book_sorter.hpp"


BookSorter::BookSorter() {}
BookSorter::~BookSorter() {}
std::vector<Book> BookSorter::getBooks() { return books; }
void BookSorter::setBooks(std::vector<Book> books) { this->books = books; }


void BookSorter::sort()
{
    if (! books.empty())
        qsort(0, books.size() - 1);
}


void BookSorter::qsort(int low, int high)
{
    int part;

    if (low < high)
    {
        part = partition(low, high);
        qsort(low, part - 1);
        qsort(part, high);
    }
}


int BookSorter::partition(int low, int high)
{
    Book pivot = books[high];
    int i, j;

    for (j = i = low; j < high; j++)
        if (compare(books[j], pivot) <= 0)
            std::swap(books[i++], books[j]);

    std::swap(books[i], books[high]);
    return i;
}
