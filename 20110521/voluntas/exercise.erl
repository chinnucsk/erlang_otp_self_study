-module(exercise).

-export([sum/1, sum/2]).
-export([create/1, reverse_create/1]).
-export([print/1]).

%% Exercise 3-1: Evaluating Expressions

sum(N) when 1 =< N ->
  lists:sum(lists:seq(1, N)).

sum(N, M) when N =< M ->
  lists:sum(lists:seq(N, M)).

%% Exercise 3-2: Creating Lists

create(N) ->
  lists:seq(1, N).

reverse_create(N) ->
  lists:reverse(lists:seq(1, N)).

%% Exercise 3-3: Side Effects

print(X) when 1 =< X ->
  F = fun(N) ->
        io:format("Number: ~p~n", [N])
      end,
  lists:foreach(F, lists:seq(1, X)).

%% Exercise 3-5: Manipulating Lists

-spec filter([pos_integer()], pos_integer()) -> [pos_integer()].
filter(List, N) ->
  [ X || X <- List, X =< N].

reverse([], Acc) ->
  Acc;
reverse([H|T], Acc) ->
  reverse(T, [H|Acc]).

concatenate([], Acc) ->
  Acc;
concatenate([H|T], Acc) ->
  H|T
