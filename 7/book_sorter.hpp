#pragma once

#include <vector>
#include "book.hpp"

class BookSorter
{
    private:
        std::vector<Book> books;
        void qsort(int, int);
        int partition(int, int);

    public:
        std::vector<Book> getBooks();
        void setBooks(std::vector<Book>);

        void printBooks();
        void sort();
        virtual int compare(Book, Book) = 0;

        BookSorter();
        virtual ~BookSorter() = 0;
};
