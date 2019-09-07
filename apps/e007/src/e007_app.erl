%%%-------------------------------------------------------------------
%% @doc e007 public API
%% @end
%%%-------------------------------------------------------------------

-module(e007_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    e007_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
