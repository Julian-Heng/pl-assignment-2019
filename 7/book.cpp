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

std::ostream& operator<<(std::ostream& stream, const Book& book)
{
    return stream << "Book(" <<
        "ID: " << book.getID() << ", " <<
        "Name: " << book.getName() << ", " <<
        "ISBN: " << book.getISBN() << ")";
}
