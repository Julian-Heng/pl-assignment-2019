#include <string>
#include "book.hpp"

Book::Book()
{
    setBookID(-1);
    setBookName("");
    setBookISBN("");
}

Book::~Book() {}


int Book::getBookID() { return bookID; }
std::string Book::getBookName() { return bookName; }
std::string Book::getBookISBN() { return bookISBN; }

void Book::setBookID(int bookID) { this->bookID = bookID; }
void Book::setBookName(std::string bookName) { this->bookName = bookName; }
void Book::setBookISBN(std::string bookISBN) { this->bookISBN = bookISBN; }
