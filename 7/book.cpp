#include <iostream>
#include <string>

#include "book.hpp"


Book::Book()
{
    setID(-1);
    setName("");
    setISBN("");
}

Book::~Book() {}


int Book::getID() const { return ID; }
std::string Book::getName() const { return name; }
std::string Book::getISBN() const { return ISBN; }

void Book::setID(int ID) { this->ID = ID; }
void Book::setName(std::string name) { this->name = name; }
void Book::setISBN(std::string ISBN) { this->ISBN = ISBN; }

std::ostream& operator<<(std::ostream& strm, const Book& b)
{
    // Return a string representation of a book
    return strm <<
        "Book(" <<
        "ID: " << b.getID() << ", " <<
        "Name: " << b.getName() << ", " <<
        "ISBN: " << b.getISBN() << ")";
}
