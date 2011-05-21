-module(exercise_3_1).
-export([sum/1, sum/2]).
sum_acc(0,   Total) -> Total;
sum_acc(Num, Total) -> sum_acc(Num - 1, Total + Num).

sum_list_acc([], Total) -> Total;
sum_list_acc([Head | Tail], Total) -> sum_list_acc(Tail, Head + Total).

sum(Num) -> sum_acc(Num, 0).
sum(StartNum, EndNum) when StartNum =< EndNum -> 
  List = lists:seq(StartNum, EndNum, 1),
  sum_list_acc(List, 0).
