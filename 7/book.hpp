#pragma once

class Book
{
    private:
        int bookID;
        std::string bookName;
        std::string bookISBN;

    public:
        int getBookID();
        std::string getBookName();
        std::string getBookISBN();

        void setBookID(int);
        void setBookName(std::string);
        void setBookISBN(std::string);

        Book();
        ~Book();
};
