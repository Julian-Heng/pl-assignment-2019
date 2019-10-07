#include <iostream>
#include <regex>
#include <vector>

#include "book.hpp"
#include "book_sorter.hpp"


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
    std::vector<std::string> args;
    bool exit = false;

    for (int i = 1; i < argc; i++)
        args.push_back(argv[i]);

    for (std::string i : args)
    {
        if (! i.compare("--id") || ! i.compare("-i"))
            sorter = new BookSortByID;
        else if (! i.compare("--name") || ! i.compare("-n"))
            sorter = new BookSortByName;
        else if (! i.compare("--isbn") || ! i.compare("-b"))
            sorter = new BookSortByISBN;
        else if (! i.compare("--help") || ! i.compare("-h"))
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
