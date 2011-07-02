-module(exercise_3_1).
-export([sum/1, sum/2]).
sum_acc([], Total) -> Total;
sum_acc([Head | Tail], Total) -> sum_acc(Tail, Head + Total).

sum(Num) -> sum_acc(lists:seq(1, Num), 0).
sum(StartNum, EndNum) when StartNum =< EndNum -> 
  List = lists:seq(StartNum, EndNum, 1),
  sum_acc(List, 0).
