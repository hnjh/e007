-module(es_accesstokens_handler).

-behaviour(cowboy_rest).

-export([init/2]).
-export([allowed_methods/2]).
-export([content_types_provided/2]).
-export([content_types_accepted/2]).
-export([resource_exists/2]).
-export([to_json/2]).

init(Req, State) ->
  {cowboy_rest, Req, State}.

allowed_methods(Req, State) ->
  AllowedMethods = [<<"POST">>, <<"DELETE">>],
  {AllowedMethods, Req, State}.

content_types_accepted(Req, State) ->
  {[
    {{<<"application">>, <<"json">>, '*'}, to_json}
  ], Req, State}.

content_types_provided(Req, State) ->
  {[
    {{<<"application">>, <<"json">>, '*'}, to_json}
  ], Req, State}.

to_json(Req, State) ->
  {<<"{}">>, Req, State}.

resource_exists(Req, State) ->
  Method = cowboy_req:method(Req),
  {Method =/= <<"POST">>, Req, State}.
