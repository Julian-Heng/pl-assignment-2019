CXX = g++
CPPFLAGS = -g -Wall -Werror -pedantic -std=c++11
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)
EXEC = sort_books

$(EXEC): $(OBJ)
	$(CXX) -o $@ $^

clean:
	$(RM) -v $(OBJ) $(EXEC)
