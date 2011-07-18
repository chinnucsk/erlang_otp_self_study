-module(ch3).
-compile(export_all).

% sum(N) -> lists:foldl(fun(X, Y) -> X + Y end, 0, lists:seq(1, N)).

% ex3-1
sum(N) -> sum(1, N, 0).
sum(M, N) -> sum(M, N, 0).
sum(M, N, S) when M < N ->
  sum(M, N-1, S+N);
sum(M, N, S) when M == N ->
  S + M.

% ex3-2
create(N) -> create(N, []).
create(0, List) -> List;
create(N, List) -> create(N-1, [N|List]).

reverse(List) -> reverse(List, []).
reverse([X|List1], List2) -> reverse(List1, [X|List2]);
reverse([], List) -> List.

% ex3-3
print_nums(N) -> io:format("~w~n", [create(N)]).
print_even_nums(N) ->
  io:format("~w~n", [[X || X <- create(N), X rem 2 == 0]]).

% ex3-5
filter([H|T], Until) ->
  case H of
    Until -> [Until];
    _ -> [H|filter(T, Until)]
  end;
filter([],_) -> [].

% reverse was defined above

concatenate(List) ->
  [Y || X <- List, Y <- X].

flatten([H|T]) ->
  concatenate([flatten(H), flatten(T)]);
flatten([]) -> [];
flatten(X) -> [X].

% ex3-6
qs([]) -> [];
qs([H|T]) ->
  qs([X || X <- T, X < H]) ++ [H] ++ qs([X || X <- T, X >= H]).

ms([]) -> [];
ms([X]) -> [X];
ms(List) ->
  {Former, Latter} = lists:split(length(List) div 2, List),
  ms0(ms(Former), ms(Latter), []).
  
ms0([], Y, Z) ->
  lists:reverse(Z) ++ Y;
ms0(X, [], Z) ->
  lists:reverse(Z) ++ X;
ms0([H|T]=L, [I|U]=M, Z) ->
  if
    H < I -> ms0(T, M, [H|Z]);
    true  -> ms0(L, U, [I|Z])
  end.
