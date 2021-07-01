-module(death).
-export([start/2]).

start(N, M) ->
  H = lists:foldl(
    fun(Id, Pid) -> spawn_link(fun() -> loop(Id, Pid, M) end) end,
    self(),
    lists:seq(N, 2, -1)),
  H ! M,
  loop(1, H, M).

loop(Id, Pid, M) ->
  receive
    1 ->
      {_, Time} = statistics(runtime),
      io:format("~p threads in ~p ms~n", [M, Time]),
      exit(self(), ok);
    Index ->
      erlang:bump_reductions(0),
      Pid ! Index - 1,
      loop(Id, Pid, M)
  end.