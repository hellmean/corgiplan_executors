%%%-------------------------------------------------------------------
%% @doc corgiplan_executors public API
%% @end
%%%-------------------------------------------------------------------

-module(corgiplan_executors_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    net_adm:world(),
    corgiplan_executors_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
