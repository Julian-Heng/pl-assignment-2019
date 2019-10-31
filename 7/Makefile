CXX = g++
CPPFLAGS = -g -Wall -Werror -pedantic -std=c++11
SRC = $(wildcard *.cpp)
OBJ = $(SRC:.cpp=.o)
EXEC = sort_books

$(EXEC): $(OBJ)
	@mkdir -p ./build
	$(CXX) -o ./build/$@ $^

test: $(EXEC)
	@bash test.sh

clean:
	$(RM) -rv $(OBJ) ./build
