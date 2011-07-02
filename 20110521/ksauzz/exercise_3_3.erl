-module(exercise_3_3).
-export([print_seq/1, print_even_seq/1]).

%print_seq(Num) when Num > 0 ->
  %Print = fun(X) -> io:format("Number: ~p~n",[X]) end,
  %lists:map(Print, lists:seq(1, Num, 1)).

print_seq_acc([]) -> [];
print_seq_acc([H|T]) -> 
  io:format("Number: ~p~n",[H]),
  print_seq_acc(T).

print_even_seq_acc([]) -> [];
print_even_seq_acc([H|T]) when H rem 2 == 1 -> 
  print_even_seq_acc(T);
print_even_seq_acc([H|T]) when H rem 2 == 0 -> 
  io:format("Number: ~p~n",[H]),
  print_even_seq_acc(T).

print_seq(Num) when Num > 0 ->
  print_seq_acc(lists:seq(1, Num, 1)).

print_even_seq(Num) when Num > 0 ->
  print_even_seq_acc(lists:seq(1, Num, 1)).
