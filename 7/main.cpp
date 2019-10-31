#include <iostream>
#include <regex>
#include <vector>

#include "book.hpp"
#include "book_sorter.hpp"

#include "main.hpp"


int main(int argc, char** argv)
{
    int ret = 0;
    BookSorter* sorter = setup(argc, argv);

    // If invalid arguments are passed
    if (! sorter)
        ret = 1;
    else
    {
        // Sort and print
        sorter->setBooks(parseBooks());
        sorter->sort();
        for (Book b : sorter->getBooks())
            std::cout << b << std::endl;

        delete sorter;
    }

    return ret;
}


BookSorter* setup(int argc, char** argv)
{
    BookSorter* sorter = nullptr;
    std::string str;
    int choice = 0;

    // Determine which sorter to use
    for (int i = 1; i < argc; i++)
    {
        str = argv[i];
        if (STRCMP(str, "--help") || STRCMP(str, "-h"))
            choice = -1;
        else if (STRCMP(str, "--id") || STRCMP(str, "-i"))
            choice = 0;
        else if (STRCMP(str, "--name") || STRCMP(str, "-n"))
            choice = 1;
        else if (STRCMP(str, "--isbn") || STRCMP(str, "-b"))
            choice = 2;
    }

    switch (choice)
    {
        case -1:
            std::cerr <<
                "Usage: " << argv[0] << " option\n" <<
                "  --id, -i    Sort by ID [default]\n" <<
                "  --name, -n  Sort by Name\n" <<
                "  --isbn, -b  Sort by ISBN" << std::endl;
            break;

        default:
        case 0: sorter = new BookSortByID; break;
        case 1: sorter = new BookSortByName; break;
        case 2: sorter = new BookSortByISBN; break;
    }

    return sorter;
}


std::vector<Book> parseBooks()
{
    Book newBook;
    std::vector<Book> books;
    std::string in;

    // Use regex to parse books
    std::regex reg ("^(\\d+),(.*),([^,]*)$");
    std::smatch match;

    while (std::getline(std::cin, in))
    {
        while (std::regex_search(in, match, reg))
        {
            // Right amounts of matches
            if (match.size() == 4)
            {
                newBook = Book();
                newBook.setID(std::stoi(match.str(1)));
                newBook.setName(match.str(2));
                newBook.setISBN(match.str(3));
                books.push_back(newBook);
            }

            in = match.suffix().str();
        }
    }

    return books;
}


/*
 * Book sorter implementations
 *
 * -1 means that a is less than b
 *  0 means that a is equal to b
 *  1 means that a is more than b
 */

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
