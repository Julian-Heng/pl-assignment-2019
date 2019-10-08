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
        BookSorter();
        virtual ~BookSorter();

        std::vector<Book> getBooks();
        void setBooks(std::vector<Book>);

        void sort();
        virtual int compare(Book, Book) = 0;
};
