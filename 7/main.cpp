#include <iostream>
#include <regex>
#include <vector>

#include "book.hpp"
#include "book_sorter.hpp"

#define STRCMP(s1, s2) \
    ! (s1).compare((s2))


BookSorter* setup(int, char**);
std::vector<Book> parseBooks(void);


int main(int argc, char** argv)
{
    int ret = 0;
    BookSorter* sorter = setup(argc, argv);

    if (! sorter)
        ret = 1;
    else
    {
        sorter->setBooks(parseBooks());
        sorter->sort();
        sorter->printBooks();
        delete sorter;
    }

    return ret;
}


BookSorter* setup(int argc, char** argv)
{
    BookSorter* sorter = NULL;
    std::string str;
    bool exit = false;

    for (int i = 1; i < argc; i++)
    {
        str = argv[i];

        if (STRCMP(str, "id") || STRCMP(str, "-i"))
        {
            if (sorter)
                delete sorter;

            sorter = new BookSortByID;
        }
        else if (STRCMP(str, "--name") || STRCMP(str, "-n"))
        {
            if (sorter)
                delete sorter;

            sorter = new BookSortByName;
        }
        else if (STRCMP(str, "--isbn") || STRCMP(str, "-b"))
        {
            if (sorter)
                delete sorter;

            sorter = new BookSortByISBN;
        }
        else if (STRCMP(str, "--help") || STRCMP(str, "-h"))
        {
            if (sorter)
            {
                delete sorter;
                sorter = NULL;
            }

            exit = true;
            std::cerr <<
                "Usage: " << argv[0] << " option\n" <<
                "  --id, -i    Sort by ID [default]\n" <<
                "  --name, -n  Sort by Name\n" <<
                "  --isbn, -b  Sort by ISBN" << std::endl;
        }
    }

    return sorter == NULL && ! exit ? new BookSortByID : sorter;
}


std::vector<Book> parseBooks(void)
{
    Book newBook;
    std::vector<Book> books;
    std::string in;

    std::regex reg ("^(\\d+),([^,]*),([^,]*)$");
    std::smatch match;

    while (std::getline(std::cin, in))
    {
        while (std::regex_search(in, match, reg))
        {
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
