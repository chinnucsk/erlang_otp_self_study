% exercise_3_4
-module(db).
-export([new/0]).
-export([destroy/1]).
-export([write/3]).
-export([read/2]).
-export([delete/2]).
-export([match/2]).

new() ->
  [].
% nothing to do?
destroy(db) ->
  ok.
write(Key, Value, Db) ->
  [{Key, Value} | Db].

read(_, []) ->
  {error, instance};
read(Key, [{DbKey, DbValue} | _]) when Key == DbKey ->
  {ok, DbValue}; 
read(Key, [_ | Tail]) ->
  read(Key, Tail).

delete(Key, Db) ->
  delete_acc(Key, Db, []).
delete_acc(_, [], Ret) ->
  Ret;
delete_acc(Key, [{DbKey, _} | Tail], Ret) when Key == DbKey ->
  delete_acc(Key, Tail, Ret);
delete_acc(Key, [Head | Tail], Ret) ->
  delete_acc(Key, Tail, [Head | Ret]).
   
match(Key, Db) ->
  match_acc(Key, Db, []).
match_acc(_, [], Ret) ->
  Ret;
match_acc(Key, [{DbKey, DbValue} | Tail], Ret) when Key == DbKey ->
  match_acc(Key, Tail, [{DbKey, DbValue} | Ret]);
match_acc(Key, [_ | Tail], Ret) ->
  match_acc(Key, Tail, Ret).

