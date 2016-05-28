-module(bwl_srv_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    ok = diameter:start(),
    bwl_srv_sup:start_link().

stop(_State) ->
    ok = diameter:stop(),
    ok.


