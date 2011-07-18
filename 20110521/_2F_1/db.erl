-module(db).
-compile(export_all).

new() -> [].

destroy(_) -> ok.

write(Key, Value, Db) ->
  write(Key, Value, Db, []).
write(Key, Value, [H|T], Result) ->
  case H of
    {Key, _} -> [{Key, Value}|T] ++ Result;
    _ -> write(Key, Value, T, [H|Result])
  end;
write(Key, Value, [], Result) ->
  [{Key, Value}|Result].


read(_, []) ->
  {error, instance};
read(Key, [H|T]) ->
  case H of
    {Key, Value} -> {ok, Value};
    _ -> read(Key, T)
  end.

match(Value, Db) ->
  [ K || {K, V} <- Db, V == Value ].

delete(Key, Db) ->
  [{K, V} || {K, V} <- Db, K /= Key].
