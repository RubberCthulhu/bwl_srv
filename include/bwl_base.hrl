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

-record('NFR',
	{'Session-Id', 'Origin-Host', 'Origin-Realm',
	 'Destination-Realm', 'Auth-Application-Id',
	 'Service-Type', 'Notification-Point',
	 'Destination-Identity' = [],
	 'Originating-Identity' = [], 'Destination-Host' = [],
	 'Message-Reference' = [],
	 'Parent-Message-Reference' = [], 'Msg-Content' = [],
	 'Service-Info' = [], 'Opaque-Data' = [],
	 'Request-Counter' = [], 'AVP' = []}).

-record('NFA',
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

-record('Destination-Identity',
	{'Recipient-Address' = []}).

-record('Originator-Address',
	{'Address-Type' = [], 'Address-Data' = []}).

-record('Originating-Identity',
	{'Originator-Address' = []}).

-record('Recipient-Address',
	{'Address-Type' = [], 'Address-Data' = []}).

-record('Service-Info', {'AVP' = []}).


%%% -------------------------------------------------------
%%% Grouped AVP records from diameter_gen_base_rfc3588:
%%% -------------------------------------------------------

-record('Proxy-Info',
	{'Proxy-Host', 'Proxy-State', 'AVP' = []}).

-record('Failed-AVP', {'AVP' = []}).

-record('Experimental-Result',
	{'Vendor-Id', 'Experimental-Result-Code'}).

-record('Vendor-Specific-Application-Id',
	{'Vendor-Id' = [], 'Auth-Application-Id' = [],
	 'Acct-Application-Id' = []}).

-record('E2E-Sequence', {'AVP' = []}).


%%% -------------------------------------------------------
%%% ENUM Macros:
%%% -------------------------------------------------------

-define('ADDRESS-TYPE_EMAIL', 0).
-define('ADDRESS-TYPE_MSISDN', 1).
-define('ADDRESS-TYPE_IPV4', 2).
-define('ADDRESS-TYPE_IPV6', 3).
-define('ADDRESS-TYPE_NUMERIC_SHORT_CODE', 4).
-define('ADDRESS-TYPE_ALPHANUMERIC_SHORT_CODE', 5).
-define('ADDRESS-TYPE_UNKNOWN', 6).
-define('ADDRESS-TYPE_IMSI', 7).
-define('ADDRESS-TYPE_SIP_URI', 8).
-define('ARM-FUTURE-NOTIFICATION_ALL', 0).
-define('ARM-FUTURE-NOTIFICATION_PRE_SUBMISSION', 1).
-define('ARM-FUTURE-NOTIFICATION_POST_SUBMISSION', 2).
-define('ARM-FUTURE-NOTIFICATION_PRE_DELIVERY', 3).
-define('ARM-FUTURE-NOTIFICATION_POST_DELIVERY', 4).
-define('NOTIFICATION-POINT_PRE_SUBMISSION', 1).
-define('NOTIFICATION-POINT_POST_SUBMISSION', 2).
-define('NOTIFICATION-POINT_PRE_DELIVERY', 3).
-define('NOTIFICATION-POINT_POST_DELIVERY', 4).
-define('RECOMMENDED-DECISION_PROCEED', 0).
-define('RECOMMENDED-DECISION_REJECT', 1).
-define('RECOMMENDED-DECISION_COMPLETE', 2).
-define('RECOMMENDED-DECISION_DROP', 3).
-define('SERVICE-TYPE_SMS', 0).
-define('SERVICE-TYPE_MMS', 1).
-define('SERVICE-TYPE_EMAIL', 2).



%%% -------------------------------------------------------
%%% ENUM Macros from diameter_gen_base_rfc3588:
%%% -------------------------------------------------------

-ifndef('DISCONNECT-CAUSE_REBOOTING').
-define('DISCONNECT-CAUSE_REBOOTING', 0).
-endif.
-ifndef('DISCONNECT-CAUSE_BUSY').
-define('DISCONNECT-CAUSE_BUSY', 1).
-endif.
-ifndef('DISCONNECT-CAUSE_DO_NOT_WANT_TO_TALK_TO_YOU').
-define('DISCONNECT-CAUSE_DO_NOT_WANT_TO_TALK_TO_YOU', 2).
-endif.
-ifndef('REDIRECT-HOST-USAGE_DONT_CACHE').
-define('REDIRECT-HOST-USAGE_DONT_CACHE', 0).
-endif.
-ifndef('REDIRECT-HOST-USAGE_ALL_SESSION').
-define('REDIRECT-HOST-USAGE_ALL_SESSION', 1).
-endif.
-ifndef('REDIRECT-HOST-USAGE_ALL_REALM').
-define('REDIRECT-HOST-USAGE_ALL_REALM', 2).
-endif.
-ifndef('REDIRECT-HOST-USAGE_REALM_AND_APPLICATION').
-define('REDIRECT-HOST-USAGE_REALM_AND_APPLICATION', 3).
-endif.
-ifndef('REDIRECT-HOST-USAGE_ALL_APPLICATION').
-define('REDIRECT-HOST-USAGE_ALL_APPLICATION', 4).
-endif.
-ifndef('REDIRECT-HOST-USAGE_ALL_HOST').
-define('REDIRECT-HOST-USAGE_ALL_HOST', 5).
-endif.
-ifndef('REDIRECT-HOST-USAGE_ALL_USER').
-define('REDIRECT-HOST-USAGE_ALL_USER', 6).
-endif.
-ifndef('AUTH-REQUEST-TYPE_AUTHENTICATE_ONLY').
-define('AUTH-REQUEST-TYPE_AUTHENTICATE_ONLY', 1).
-endif.
-ifndef('AUTH-REQUEST-TYPE_AUTHORIZE_ONLY').
-define('AUTH-REQUEST-TYPE_AUTHORIZE_ONLY', 2).
-endif.
-ifndef('AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE').
-define('AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE', 3).
-endif.
-ifndef('AUTH-SESSION-STATE_STATE_MAINTAINED').
-define('AUTH-SESSION-STATE_STATE_MAINTAINED', 0).
-endif.
-ifndef('AUTH-SESSION-STATE_NO_STATE_MAINTAINED').
-define('AUTH-SESSION-STATE_NO_STATE_MAINTAINED', 1).
-endif.
-ifndef('RE-AUTH-REQUEST-TYPE_AUTHORIZE_ONLY').
-define('RE-AUTH-REQUEST-TYPE_AUTHORIZE_ONLY', 0).
-endif.
-ifndef('RE-AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE').
-define('RE-AUTH-REQUEST-TYPE_AUTHORIZE_AUTHENTICATE', 1).
-endif.
-ifndef('TERMINATION-CAUSE_LOGOUT').
-define('TERMINATION-CAUSE_LOGOUT', 1).
-endif.
-ifndef('TERMINATION-CAUSE_SERVICE_NOT_PROVIDED').
-define('TERMINATION-CAUSE_SERVICE_NOT_PROVIDED', 2).
-endif.
-ifndef('TERMINATION-CAUSE_BAD_ANSWER').
-define('TERMINATION-CAUSE_BAD_ANSWER', 3).
-endif.
-ifndef('TERMINATION-CAUSE_ADMINISTRATIVE').
-define('TERMINATION-CAUSE_ADMINISTRATIVE', 4).
-endif.
-ifndef('TERMINATION-CAUSE_LINK_BROKEN').
-define('TERMINATION-CAUSE_LINK_BROKEN', 5).
-endif.
-ifndef('TERMINATION-CAUSE_AUTH_EXPIRED').
-define('TERMINATION-CAUSE_AUTH_EXPIRED', 6).
-endif.
-ifndef('TERMINATION-CAUSE_USER_MOVED').
-define('TERMINATION-CAUSE_USER_MOVED', 7).
-endif.
-ifndef('TERMINATION-CAUSE_SESSION_TIMEOUT').
-define('TERMINATION-CAUSE_SESSION_TIMEOUT', 8).
-endif.
-ifndef('SESSION-SERVER-FAILOVER_REFUSE_SERVICE').
-define('SESSION-SERVER-FAILOVER_REFUSE_SERVICE', 0).
-endif.
-ifndef('SESSION-SERVER-FAILOVER_TRY_AGAIN').
-define('SESSION-SERVER-FAILOVER_TRY_AGAIN', 1).
-endif.
-ifndef('SESSION-SERVER-FAILOVER_ALLOW_SERVICE').
-define('SESSION-SERVER-FAILOVER_ALLOW_SERVICE', 2).
-endif.
-ifndef('SESSION-SERVER-FAILOVER_TRY_AGAIN_ALLOW_SERVICE').
-define('SESSION-SERVER-FAILOVER_TRY_AGAIN_ALLOW_SERVICE', 3).
-endif.
-ifndef('ACCOUNTING-RECORD-TYPE_EVENT_RECORD').
-define('ACCOUNTING-RECORD-TYPE_EVENT_RECORD', 1).
-endif.
-ifndef('ACCOUNTING-RECORD-TYPE_START_RECORD').
-define('ACCOUNTING-RECORD-TYPE_START_RECORD', 2).
-endif.
-ifndef('ACCOUNTING-RECORD-TYPE_INTERIM_RECORD').
-define('ACCOUNTING-RECORD-TYPE_INTERIM_RECORD', 3).
-endif.
-ifndef('ACCOUNTING-RECORD-TYPE_STOP_RECORD').
-define('ACCOUNTING-RECORD-TYPE_STOP_RECORD', 4).
-endif.
-ifndef('ACCOUNTING-REALTIME-REQUIRED_DELIVER_AND_GRANT').
-define('ACCOUNTING-REALTIME-REQUIRED_DELIVER_AND_GRANT', 1).
-endif.
-ifndef('ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_STORE').
-define('ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_STORE', 2).
-endif.
-ifndef('ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_LOSE').
-define('ACCOUNTING-REALTIME-REQUIRED_GRANT_AND_LOSE', 3).
-endif.

