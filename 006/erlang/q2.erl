%% @author Paulo Guilherme
%% @doc @todo Add description to 'q2'.


-module(q2). 

-export([fibonnaci/1]).

fibonnaci(X) when X <2 -> 1;
fibonnaci(X) when X >= 2 ->
    fibonnaci(X-1) + fibonnaci(X-2).

%%Este programa fibonacci começa em 1;