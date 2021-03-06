-module (releaseman_routes).
-author('Maxim Sokhatsky').
-behaviour (route_handler).
-include_lib("n2o/include/wf.hrl").
-export([init/2, finish/2]).

finish(State, Ctx) -> {ok, State, Ctx}.
init(State, Ctx) -> 
    Path = wf:path(Ctx#context.req),
    {Module, PathInfo} = route(Path),
    {ok, State, Ctx#context{path=PathInfo,module=Module}}.

route(<<"/">>) -> {public_index, []};
route(<<"/index">>) -> {public_index, []};
route(<<"/index/[...]">>) -> {public_index, []};
route(<<"/ws/">>) -> {public_index, []};
route(<<"/ws/index">>) -> {public_index, []};
route(<<"/favicon.ico">>) -> {static_file, []};
route(_) -> {public_index, []}.
