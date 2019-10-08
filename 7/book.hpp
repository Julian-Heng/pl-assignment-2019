#pragma once

#include <string>

class Book
{
    private:
        friend std::ostream& operator<<(std::ostream&, const Book&);

        int ID;
        std::string name;
        std::string ISBN;

    public:
        Book();
        ~Book();

        int getID() const;
        std::string getName() const;
        std::string getISBN() const;

        void setID(int);
        void setName(std::string);
        void setISBN(std::string);
};
