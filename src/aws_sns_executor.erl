-module(aws_sns_executor).

-behaviour(corgiplan_executor).

-export([init/0, handle_request/3, start_link/0]).

init() ->
    {ok, []}.

handle_request(send_message, {Topic, Message}, State) ->
    Cmd = io_lib:format("aws sns publish --topic-arn '~w' --message '~w'", [Topic, Message]),
    Result = os:cmd(Cmd),
    {ok, Result, State}.

start_link() ->
    corgiplan_executor:start_link({global, aws_sns_executor}, aws_sns_executor).