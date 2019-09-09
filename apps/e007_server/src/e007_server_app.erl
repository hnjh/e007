%%%-------------------------------------------------------------------
%% @doc e007_server public API
%% @end
%%%-------------------------------------------------------------------

-module(e007_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    e007_server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
