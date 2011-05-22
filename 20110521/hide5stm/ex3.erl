-module(ex3).
-export([sum/1, sum/2, create/1, reverse_create/1,
	 print_int/1, print_even/1]).

% ex 3-1
sum(M, M) -> M;
sum(M, N) -> N + sum(M, N -1).

sum(N) -> sum(1, N).

% ex 3-2
create(1) -> [1];
create(N) -> lists:append(create(N - 1), [N]).

reverse_create(1) -> [1];
reverse_create(N) -> lists:append([N], reverse_create(N - 1)).

% ex 3-3
print_int(1) -> io:format("Number:~p~n", [1]);
print_int(N) -> print_int(N - 1), io:format("Number:~p~n", [N]).

print_even(2) ->
    io:format("Number:~p~n", [2]);
print_even(N) when (N rem 2) == 1 ->
    print_even(N - 1);
print_even(N) when (N rem 2) == 0 ->
    print_even(N - 2), io:format("Number:~p~n", [N]).

% ex 3-4

% ex 3-5

% ex 3-6
% ex 3-7
% ex 3-8
% ex 3-9
% ex 3-10
