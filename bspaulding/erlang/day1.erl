-module(day1).
-export([words/1]).

words(String, false, Count) -> Count + 1;
words(String, true, Count) -> words( string:substr(String, string:str(String, " ") + 1, string:len(String)), string:str(String, " ") > 0, Count + 1 ).
words(String) -> words( string:substr(String, string:str(String, " ") + 1, string:len(String)), string:str(String, " ") > 0, 0 ).

% count_to_ten(10) -> io:put_chars("10\n");
% count_to_ten(N) -> io:put_chars(
