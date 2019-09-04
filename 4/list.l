%{
#include "list.tab.h"
%}

%%
[0-9]+  { yylval = atoi(yytext); return TOKEN_NUMBER; }
\[      { return TOKEN_START; }
\]      { return TOKEN_END; }
,       { return TOKEN_SEPERATOR; }
\n      { return TOKEN_TERMINATE; }
[ \t]+
%%
