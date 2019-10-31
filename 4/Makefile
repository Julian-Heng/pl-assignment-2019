CC = gcc
CFLAGS = -g -Wall -pedantic -std=c99
LDFLAGS = -ll

YACC = yacc
YFLAGS = -d
LC = lex

BUILD = ./build

list: list_lex list_yacc
	$(CC) $(LDFLAGS) $(CFLAGS) -o $(BUILD)/list \
		$(BUILD)/list.lex.o \
		$(BUILD)/list.tab.o


list_lex: dir list_yacc
	$(LC) -o $(BUILD)/list.lex.c ./list.l
	$(CC) $(CFLAGS) -c -o $(BUILD)/list.lex.o $(BUILD)/list.lex.c


list_yacc: dir
	$(YACC) $(YFLAGS) -o $(BUILD)/list.tab.c ./list.y
	$(CC) $(CFLAGS) -c -o $(BUILD)/list.tab.o $(BUILD)/list.tab.c


dir:
	@mkdir -p $(BUILD)


clean:
	$(RM) -rv $(BUILD)


test: list
	@bash test.sh
