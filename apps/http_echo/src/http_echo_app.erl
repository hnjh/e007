%%%-------------------------------------------------------------------
%% @doc http_echo public API
%% @end
%%%-------------------------------------------------------------------

-module(http_echo_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    http_echo_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
