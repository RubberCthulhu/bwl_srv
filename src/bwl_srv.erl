%%%-------------------------------------------------------------------
%%% @author Danil Onishchenko <danil.onishchenko.info@gmail.com>
%%% @copyright (C) 2016, Danil Onishchenko
%%% @doc
%%%
%%% @end
%%% Created : 26 May 2016 by Danil Onishchenko <danil.onishchenko.info@gmail.com>
%%%-------------------------------------------------------------------
-module(bwl_srv).

-behaviour(gen_server).

%% API
-export([start_link/0, stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2, handle_info/2,
	 terminate/2, code_change/3]).

%% Diameter callbacks
-export([peer_up/3,
	 peer_down/3,
	 pick_peer/4,
	 prepare_request/3,
	 prepare_retransmit/3,
	 handle_answer/4,
	 handle_error/4,
	 handle_request/3]).

-define(SERVER, ?MODULE).

-record(state, {
	  svc_name :: atom(),
	  transport :: diameter:transport_ref()
	 }).

-include("bwl_base.hrl").
-include_lib("diameter.hrl").
-include_lib("diameter_gen_base_rfc3588.hrl").

%%%===================================================================
%%% API
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the server
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
    gen_server:start_link({local, ?SERVER}, ?MODULE, [], []).

stop() ->
    gen_server:cast(?SERVER, stop).

%%%===================================================================
%%% gen_server callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Initializes the server
%%
%% @spec init(Args) -> {ok, State} |
%%                     {ok, State, Timeout} |
%%                     ignore |
%%                     {stop, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
    SvcName = ?SERVER,
    SvcOpts = [{'Origin-Host', "bwlsrv.sk.ru"},
	       {'Origin-Realm', "sk.ru"},
	       {'Vendor-Specific-Application-Id',
		[#'diameter_base_Vendor-Specific-Application-Id'{'Vendor-Id' = [3830], 'Auth-Application-Id' = [16777275]}]
	       },
	       {'Vendor-Id', 0},
	       {'Host-IP-Address', [{192, 168, 14, 74}]},
	       {'Product-Name', "bwlsrv"},
	       {'Supported-Vendor-Id', [3830, 10415]},
	       {application, [{alias, diameter_base_app},
			      %%{dictionary, ?DIAMETER_DICT_COMMON},
			      {dictionary, bwl_base},
			      {module, ?MODULE}]}],
    TransportOpts = [{transport_module, diameter_tcp},
		     {transport_config, [{reuseaddr, true},
					 {ip, {0, 0, 0, 0}},
					 {port, 3869}]}],
    
    case diameter:start_service(SvcName, SvcOpts) of
	ok ->
	    case diameter:add_transport(SvcName, {listen, TransportOpts}) of
		{ok, TransportRef} ->
		    diameter:subscribe(SvcName),
		    State = #state{
			       svc_name = SvcName,
			       transport = TransportRef
			      },
		    {ok, State};
		Error ->
		    diameter:stop_service(SvcName),
		    {stop, Error}
	    end;
	Error ->
	    {stop, Error}
    end.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling call messages
%%
%% @spec handle_call(Request, From, State) ->
%%                                   {reply, Reply, State} |
%%                                   {reply, Reply, State, Timeout} |
%%                                   {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, Reply, State} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_call(_Request, _From, State) ->
    Reply = ok,
    {reply, Reply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling cast messages
%%
%% @spec handle_cast(Msg, State) -> {noreply, State} |
%%                                  {noreply, State, Timeout} |
%%                                  {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_cast(stop, State) ->
    {stop, normal, State};

handle_cast(_Msg, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Handling all non call/cast messages
%%
%% @spec handle_info(Info, State) -> {noreply, State} |
%%                                   {noreply, State, Timeout} |
%%                                   {stop, Reason, State}
%% @end
%%--------------------------------------------------------------------
handle_info(#diameter_event{info = {closed = Type, _Ref, Reason, _Config}} = _Event, State) ->
    error_logger:info_msg("diameter event: ~p: ~p", [Type, Reason]),
    {noreply, State};

handle_info(#diameter_event{} = Event, State) ->
    error_logger:info_msg("diameter event: ~p", [Event]),
    {noreply, State};

handle_info(_Info, State) ->
    {noreply, State}.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% This function is called by a gen_server when it is about to
%% terminate. It should be the opposite of Module:init/1 and do any
%% necessary cleaning up. When it returns, the gen_server terminates
%% with Reason. The return value is ignored.
%%
%% @spec terminate(Reason, State) -> void()
%% @end
%%--------------------------------------------------------------------
terminate(_Reason, _State) ->
    ok.

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Convert process state when code is changed
%%
%% @spec code_change(OldVsn, State, Extra) -> {ok, NewState}
%% @end
%%--------------------------------------------------------------------
code_change(_OldVsn, State, _Extra) ->
    {ok, State}.

%%%===================================================================
%%% Diameter callbacks
%%%===================================================================
-define(UNEXPECTED, erlang:error({unexpected, ?MODULE, ?LINE})).

peer_up(_SvcName, {PeerRef, _}, State) ->
    error_logger:info_msg("up: ~p", [PeerRef]),
    State.

peer_down(_SvcName, {PeerRef, _}, State) ->
    error_logger:info_msg("down: ~p", [PeerRef]),
    State.

pick_peer(_, _, _SvcName, _State) ->
    ?UNEXPECTED.

prepare_request(_, _SvcName, _Peer) ->
    ?UNEXPECTED.

prepare_retransmit(_Packet, _SvcName, _Peer) ->
    ?UNEXPECTED.

handle_answer(_Packet, _Request, _SvcName, _Peer) ->
    ?UNEXPECTED.

handle_error(_Reason, _Request, _SvcNAme, _Peer) ->
    ?UNEXPECTED.

handle_request(#diameter_packet{msg = Req, errors = Errors}, _SvcName, {_PeerRef, Caps})
  when is_record(Req, bwl_NFR) ->
    %%error_logger:info_msg("ERRORS: ~p", [Errors]),
    #diameter_caps{
       origin_host = {OrigHost, _},
       origin_realm = {OrigRealm, _}
      } = Caps,
    #bwl_NFR{
       'Session-Id' = SessionId,
       'Originating-Identity' = OrigIdentity,
       'Destination-Identity' = DestIdentity
      } = Req,
    Ans = #bwl_NFA{
	     'Session-Id' = SessionId,
	     'Origin-Host' = OrigHost,
	     'Origin-Realm' = OrigRealm,
	     'Auth-Application-Id' = 16777275,
	     'Result-Code' = ?'DIAMETER_BASE_RESULT-CODE_DIAMETER_SUCCESS',
	     'Recommended-Decision' = ?'BWL_RECOMMENDED-DECISION_PROCEED',
	     'Recommended-Decision-Reason' = [0],
	     'Originating-Identity' = OrigIdentity,
	     'Destination-Identity' = DestIdentity
	    },
    {reply, Ans};
handle_request(Packet, _SvcName, {_PeerRef, _Caps}) ->
    error_logger:info_msg("PACKET: ~p", [Packet]),
    discard.

%%%===================================================================
%%% Internal functions
%%%===================================================================


