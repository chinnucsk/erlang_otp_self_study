-module(exercise3).
-export([sum/1, sum/2, create/1, reverse_create/1, print_list/1, print_even/1]).

sum(0) ->
    0;
sum(N) ->
    N + sum(N-1).

sum(N, N) ->
    N;
sum(N, M) when N < M ->
    N + sum(N + 1, M).

create(0) ->
    [];
create(N) when N >= 1 ->
    create(N - 1) ++ [N].

reverse_create(0) ->
    [];
reverse_create(N) when N >= 1 ->
    [N|reverse_create(N - 1)].

print_list(1) ->
    io:format("Number:~p~n", [1]);
print_list(N) when N >= 1 ->
    print_list(N - 1),
    io:format("Number:~p~n", [N]).

print_even(1) ->
    io:format("");
print_even(N) when (N >= 1) and (N rem 2 == 0) ->
    print_even(N - 1),
    io:format("Number:~p~n", [N]);
print_even(N) ->
    print_even(N - 1).
