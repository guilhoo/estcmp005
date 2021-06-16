%% @author Paulo Guilherme
%% @doc @todo Add description to q3.


-module(q3).

-export([main/0]).

main() ->
	junta_lista().

junta_lista() ->
	Lista1 = [1],
	Lista2 = [8,9],

	Lista3 = Lista1 ++ Lista2,
	Lista3.
