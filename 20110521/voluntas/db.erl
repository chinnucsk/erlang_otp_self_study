-module(db).

-include_lib("eunit/include/eunit.hrl").

-type db() :: [{atom(), atom()}].

-spec new() -> [].
new() ->
  [].

-spec destroy(list()) -> ok.
destroy(_Db) ->
  ok.

-spec write(atom(), atom(), db()) -> db().
write(Key, Element, Db) ->
  lists:append([{Key, Element}], Db).

-spec delete(atom(), db()) -> db().
delete(Key, Db) ->
  lists:delete({Key, Element}, Db).

-spec read(atom(), db()) -> {ok, atom()} | {error, instance}.
read(Key, Db) ->
  case lists:keyfind(Key, 1, Db) of
    false ->
      {error, instance};
    {Key, Element} ->
      {ok, Element}
  end.

-spec read(atom(), db()) -> db().
match(Element, Db) ->
  [ Element || {_Key, Element0} <- Db, Element =:= Element0].

-ifdef(TEST).

-endif.
