%% @author Paulo Guilherme
%% @doc @todo Add description to '01'.


-module(q1). 

-export([main/0]). 

main() ->
	achar_fatorial(4).

fatorial(X) when X == 0 -> 1;
fatorial(X) when X > 0 -> X * fatorial(X - 1).

achar_fatorial(N)->
	Y = fatorial(N),
	io:fwrite("Fatorial: ~p \n", [Y]).