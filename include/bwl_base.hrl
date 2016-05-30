%% -------------------------------------------------------------------
%% This is a generated file.
%% -------------------------------------------------------------------

%%
%% Copyright (c) Ericsson AB. All rights reserved.
%%
%% The information in this document is the property of Ericsson.
%%
%% Except as specifically authorized in writing by Ericsson, the
%% receiver of this document shall keep the information contained
%% herein confidential and shall protect the same in whole or in
%% part from disclosure and dissemination to third parties.
%%
%% Disclosure and disseminations to the receivers employees shall
%% only be made on a strict need to know basis.
%%

-hrl_name('bwl_base.hrl').


%%% -------------------------------------------------------
%%% Message records:
%%% -------------------------------------------------------

-record(bwl_NFR,
	{'Session-Id', 'Origin-Host', 'Origin-Realm',
	 'Destination-Realm', 'Auth-Application-Id',
	 'Service-Type', 'Notification-Point',
	 'Destination-Identity' = [],
	 'Originating-Identity' = [], 'Destination-Host' = [],
	 'Message-Reference' = [],
	 'Parent-Message-Reference' = [], 'Msg-Content' = [],
	 'Service-Info' = [], 'Opaque-Data' = [],
	 'Request-Counter' = [], 'AVP' = []}).

-record(bwl_NFA,
	{'Session-Id', 'Origin-Host', 'Origin-Realm',
	 'Auth-Application-Id', 'Result-Code',
	 'Recommended-Decision',
	 'Recommended-Decision-Reason' = [],
	 'Originating-Identity' = [],
	 'Destination-Identity' = [], 'Msg-Content' = [],
	 'Service-Info' = [], 'Arm-Future-Notification' = [],
	 'Opaque-Data' = [], 'Msg-Noncompliance-Code' = [],
	 'AVP' = []}).


%%% -------------------------------------------------------
%%% Grouped AVP records:
%%% -------------------------------------------------------

-record('bwl_Destination-Identity',
	{'Recipient-Address' = []}).

-record('bwl_Originator-Address',
	{'Address-Type' = [], 'Address-Data' = []}).

-record('bwl_Originating-Identity',
	{'Originator-Address' = []}).

-record('bwl_Recipient-Address',
	{'Address-Type' = [], 'Address-Data' = []}).

-record('bwl_Service-Info', {'AVP' = []}).


%%% -------------------------------------------------------
%%% Grouped AVP records from diameter_gen_base_rfc3588:
%%% -------------------------------------------------------

-record('bwl_Proxy-Info',
	{'Proxy-Host', 'Proxy-State', 'AVP' = []}).

-record('bwl_Failed-AVP', {'AVP' = []}).

-record('bwl_Experimental-Result',
	{'Vendor-Id', 'Experimental-Result-Code'}).

-record('bwl_Vendor-Specific-Application-Id',
	{'Vendor-Id' = [], 'Auth-Application-Id' = [],
	 'Acct-Application-Id' = []}).

-record('bwl_E2E-Sequence', {'AVP' = []}).


%%% -------------------------------------------------------
%%% ENUM Macros:
%%% -------------------------------------------------------

-define('BWL_ADDRESS-TYPE_EMAIL', 0).
-define('BWL_ADDRESS-TYPE_MSISDN', 1).
-define('BWL_ADDRESS-TYPE_IPV4', 2).
-define('BWL_ADDRESS-TYPE_IPV6', 3).
-define('BWL_ADDRESS-TYPE_NUMERIC_SHORT_CODE', 4).
-define('BWL_ADDRESS-TYPE_ALPHANUMERIC_SHORT_CODE', 5).
-define('BWL_ADDRESS-TYPE_UNKNOWN', 6).
-define('BWL_ADDRESS-TYPE_IMSI', 7).
-define('BWL_ADDRESS-TYPE_SIP_URI', 8).
-define('BWL_ARM-FUTURE-NOTIFICATION_ALL', 0).
-define('BWL_ARM-FUTURE-NOTIFICATION_PRE_SUBMISSION', 1).
-define('BWL_ARM-FUTURE-NOTIFICATION_POST_SUBMISSION', 2).
-define('BWL_ARM-FUTURE-NOTIFICATION_PRE_DELIVERY', 3).
-define('BWL_ARM-FUTURE-NOTIFICATION_POST_DELIVERY', 4).
-define('BWL_NOTIFICATION-POINT_PRE_SUBMISSION', 1).
-define('BWL_NOTIFICATION-POINT_POST_SUBMISSION', 2).
-define('BWL_NOTIFICATION-POINT_PRE_DELIVERY', 3).
-define('BWL_NOTIFICATION-POINT_POST_DELIVERY', 4).
-define('BWL_RECOMMENDED-DECISION_PROCEED', 0).
-define('BWL_RECOMMENDED-DECISION_REJECT', 1).
-define('BWL_RECOMMENDED-DECISION_COMPLETE', 2).
-define('BWL_RECOMMENDED-DECISION_DROP', 3).
-define('BWL_SERVICE-TYPE_SMS', 0).
-define('BWL_SERVICE-TYPE_MMS', 1).
-define('BWL_SERVICE-TYPE_EMAIL', 2).



%%% -------------------------------------------------------
%%% ENUM Macros from diameter_gen_base_rfc3588:
%%% -------------------------------------------------------

-ifndef('BWL_DISCONNECT-CAUSE_REBOOTING').
-define('BWL_DISCONNECT-CAUSE_REBOOTING', 0).
-endif.
-ifndef('BWL_DISCONNECT-CAUSE_BUSY').
-define('BWL_DISCONNECT-CAUSE_BUSY', 1).
-endif.
-ifndef('BWL_DISCONNECT-CAUSE_DO_NOT_WANT_TO_TALK_TO_YOU').
-define('BWL_DISCONNECT-CAUSE_DO_NOT_WANT_TO_TALK_TO_YOU', 2).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_DONT_CACHE').
-define('BWL_REDIRECT-HOST-USAGE_DONT_CACHE', 0).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_ALL_SESSION').
-define('BWL_REDIRECT-HOST-USAGE_ALL_SESSION', 1).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_ALL_REALM').
-define('BWL_REDIRECT-HOST-USAGE_ALL_REALM', 2).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_REALM_AND_APPLICATION').
-define('BWL_REDIRECT-HOST-USAGE_REALM_AND_APPLICATION', 3).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_ALL_APPLICATION').
-define('BWL_REDIRECT-HOST-USAGE_ALL_APPLICATION', 4).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_ALL_HOST').
-define('BWL_REDIRECT-HOST-USAGE_ALL_HOST', 5).
-endif.
-ifndef('BWL_REDIRECT-HOST-USAGE_ALL_USER').
-define('BWL_REDIRECT-HOST-USAGE_ALL_USER', 6).
-endif.
-ifndef('BWL_AUTH-REQUEST-TYPE_AUTHENTICATE_ONLY').
-define('BWL_AUTH-REQUEST-TYPE_AUTHENTICATE_ONLY', 1).
-endif.
-ifndef('BWL_AUTH-REQUEST-TYPE_AUTHORIZE_ONLY').
-define('BWL_AUTH-REQUEST-TYPE_AUTHORIZE_ONLY', 2).
-endif.
-ifndef('BWL_AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE').
-define('BWL_AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE', 3).
-endif.
-ifndef('BWL_AUTH-SESSION-STATE_STATE_MAINTAINED').
-define('BWL_AUTH-SESSION-STATE_STATE_MAINTAINED', 0).
-endif.
-ifndef('BWL_AUTH-SESSION-STATE_NO_STATE_MAINTAINED').
-define('BWL_AUTH-SESSION-STATE_NO_STATE_MAINTAINED', 1).
-endif.
-ifndef('BWL_RE-AUTH-REQUEST-TYPE_AUTHORIZE_ONLY').
-define('BWL_RE-AUTH-REQUEST-TYPE_AUTHORIZE_ONLY', 0).
-endif.
-ifndef('BWL_RE-AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE').
-define('BWL_RE-AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE', 1).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_LOGOUT').
-define('BWL_TERMINATION-CAUSE_LOGOUT', 1).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_SERVICE_NOT_PROVIDED').
-define('BWL_TERMINATION-CAUSE_SERVICE_NOT_PROVIDED', 2).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_BAD_ANSWER').
-define('BWL_TERMINATION-CAUSE_BAD_ANSWER', 3).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_ADMINISTRATIVE').
-define('BWL_TERMINATION-CAUSE_ADMINISTRATIVE', 4).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_LINK_BROKEN').
-define('BWL_TERMINATION-CAUSE_LINK_BROKEN', 5).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_AUTH_EXPIRED').
-define('BWL_TERMINATION-CAUSE_AUTH_EXPIRED', 6).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_USER_MOVED').
-define('BWL_TERMINATION-CAUSE_USER_MOVED', 7).
-endif.
-ifndef('BWL_TERMINATION-CAUSE_SESSION_TIMEOUT').
-define('BWL_TERMINATION-CAUSE_SESSION_TIMEOUT', 8).
-endif.
-ifndef('BWL_SESSION-SERVER-FAILOVER_REFUSE_SERVICE').
-define('BWL_SESSION-SERVER-FAILOVER_REFUSE_SERVICE', 0).
-endif.
-ifndef('BWL_SESSION-SERVER-FAILOVER_TRY_AGAIN').
-define('BWL_SESSION-SERVER-FAILOVER_TRY_AGAIN', 1).
-endif.
-ifndef('BWL_SESSION-SERVER-FAILOVER_ALLOW_SERVICE').
-define('BWL_SESSION-SERVER-FAILOVER_ALLOW_SERVICE', 2).
-endif.
-ifndef('BWL_SESSION-SERVER-FAILOVER_TRY_AGAIN_ALLOW_SERVICE').
-define('BWL_SESSION-SERVER-FAILOVER_TRY_AGAIN_ALLOW_SERVICE', 3).
-endif.
-ifndef('BWL_ACCOUNTING-RECORD-TYPE_EVENT_RECORD').
-define('BWL_ACCOUNTING-RECORD-TYPE_EVENT_RECORD', 1).
-endif.
-ifndef('BWL_ACCOUNTING-RECORD-TYPE_START_RECORD').
-define('BWL_ACCOUNTING-RECORD-TYPE_START_RECORD', 2).
-endif.
-ifndef('BWL_ACCOUNTING-RECORD-TYPE_INTERIM_RECORD').
-define('BWL_ACCOUNTING-RECORD-TYPE_INTERIM_RECORD', 3).
-endif.
-ifndef('BWL_ACCOUNTING-RECORD-TYPE_STOP_RECORD').
-define('BWL_ACCOUNTING-RECORD-TYPE_STOP_RECORD', 4).
-endif.
-ifndef('BWL_ACCOUNTING-REALTIME-REQUIRED_DELIVER_AND_GRANT').
-define('BWL_ACCOUNTING-REALTIME-REQUIRED_DELIVER_AND_GRANT', 1).
-endif.
-ifndef('BWL_ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_STORE').
-define('BWL_ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_STORE', 2).
-endif.
-ifndef('BWL_ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_LOSE').
-define('BWL_ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_LOSE', 3).
-endif.

