%%%-------------------------------------------------------------------
%% @doc e007_server public API
%% @end
%%%-------------------------------------------------------------------

-module(e007_server_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [{"/v1/accesstokens", es_accesstokens_handler, []}]}
    ]),
    {ok, _} = cowboy:start_clear(e007_server_listener,
        [{port, 9009}],
        #{env => #{dispatch => Dispatch}}
    ),
    e007_server_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
