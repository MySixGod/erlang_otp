%%%-------------------------------------------------------------------
%%% @author cwt
%%% @copyright (C) 2017, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 28. 六月 2017 11:28
%%%-------------------------------------------------------------------
-module(demo1).
-author("cwt").

%% API
-compile(export_all).

-record(mail,{
  a=1,
  b=2
}).

say() ->
  {#mail.a,#mail.b}.

start() ->
  {ok,Listen} = gen_tcp:listen(8888,[binary,{package,0},{active,true}]),
  {ok,Socket}=gen_tcp:accept(Listen),
  receive
    {tcp,Socket,Bin} ->
      [Bin]
  end.


test_dict() ->
  A=dict:new(),
  _=dict:store(key,value,A),
  C=dict:from_list([{key,value2},{key,value}]),
  io:format("~p~n",[dict:size(C)]).


say2() ->
  A=fun() -> a end,
  A().

t() ->
  try say2()
  after
    io:format("clean")
  end.












