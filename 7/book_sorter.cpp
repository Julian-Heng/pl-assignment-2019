#include <iostream>
#include <limits>

#include "book_sorter.hpp"


BookSorter::BookSorter() {}
BookSorter::~BookSorter() {}


std::vector<Book> BookSorter::getBooks() { return books; }
void BookSorter::setBooks(std::vector<Book> books) { this->books = books; }


void BookSorter::printBooks()
{
    for (Book b : books)
        std::cout << b << std::endl;
}


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
    int i;

    for (int j = (i = low); j < high; j++)
        if (compare(books[j], pivot) == -1)
            std::swap(books[i++], books[j]);

    std::swap(books[i], books[high]);
    return i;
}


int BookSortByID::compare(Book b1, Book b2)
{
    int a = b1.getID();
    int b = b2.getID();
    return a < b ? -1 : a == b ? 0 : 1;
}


int BookSortByName::compare(Book b1, Book b2)
{
    std::string a = b1.getName();
    std::string b = b2.getName();
    return a < b ? -1 : a == b ? 0 : 1;
}


int BookSortByISBN::compare(Book b1, Book b2)
{
    unsigned long a = std::stol(b1.getISBN());
    unsigned long b = std::stol(b2.getISBN());
    return a < b ? -1 : a == b ? 0 : 1;
}
