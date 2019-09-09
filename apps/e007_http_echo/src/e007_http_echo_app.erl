%%%-------------------------------------------------------------------
%% @doc e007_http_echo public API
%% @end
%%%-------------------------------------------------------------------

-module(e007_http_echo_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/", e007_http_echo_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(my_http_listener,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    e007_http_echo_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
