CC = gcc
CFLAGS = -g -Wall -pedantic -std=c99 -ll

YACC = yacc
YFLAGS = -d
LC = lex

BUILD = ./build
SOURCES := $(shell printf "%s\n" ./*.l)
EXEC = $(SOURCES:%.l=%)

all: $(EXEC)

%: %.l
	@mkdir -p $(BUILD)
	$(LC) -o $(BUILD)/$(^:%.l=%).lex.c $^
	$(YACC) $(YFLAGS) -o $(BUILD)/$(^:%.l=%).tab.c $(^:%.l=%.y)
	$(CC) -o $(BUILD)/$(^:%.l=%) \
		$(BUILD)/$(^:%.l=%).lex.c \
		$(BUILD)/$(^:%.l=%).tab.c \
		$(CFLAGS)


clean:
	$(RM) -rv $(BUILD)


test: all
	@bash test.sh
