#pragma once

#include <vector>

#include "book.hpp"
#include "book_sorter.hpp"

#define STRCMP(s1, s2) ! (s1).compare((s2))

BookSorter* setup(int, char**);
std::vector<Book> parseBooks(void);


class BookSortByID: public BookSorter { public: int compare(Book, Book); };
class BookSortByName: public BookSorter { public: int compare(Book, Book); };
class BookSortByISBN: public BookSorter { public: int compare(Book, Book); };
