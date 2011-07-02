-module(exercise_3_2).
-export([create/1, reverse_create/1]).
create_acc(0, List) -> List;
create_acc(Num, List) -> create_acc(Num - 1, [Num | List]).

create(Num) when Num >= 0 -> create_acc(Num, []).

reverse_create_acc(Max, Max, List) -> List;
reverse_create_acc(Max, Cnt, List) 
  -> reverse_create_acc(Max, Cnt + 1, [Cnt + 1| List]).

reverse_create(Num) when Num >= 0 -> reverse_create_acc(Num, 0, []).
