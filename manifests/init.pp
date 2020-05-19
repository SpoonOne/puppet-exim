# == class: exim
#
# This module configures exim
#
# === Parameters
#
# [*acl_not_smtp*]
#   Name of acl used for local generated mail. (sendmail)
#
# [*acl_smtp_auth*]
#   Name of acl used for auth checking
#   Type: string
#
# [*acl_smtp_data*]
#   Name of acl used for data checking
#     (runs after SMTP "." command)
#   Type: string
#
# [*acl_smtp_mail*]
#   Name of acl used for mail checking
#     (runs after SMTP "MAIL FROM:" command)
#   Type: string
#
# [*acl_smtp_mime*]
#   Name of acl used for maime checking
#   Type: string
#
# [*acl_smtp_rcpt*]
#   Name of acl used for rcpt checking.
#     (runs after SMTP "RCPT TO:" command)
#   Type: string
#
# [*allow_mx_to_ip*]
#   Using an ip instead of an fqdn in DNS MX records violates the RFC,
#   this option allows sending mails to these domains anyways.
#   Type: bool
#
# [*auto_thaw*]
#   Thaw frozen mails in our mailq after this time
#   Type: string
#   Example: "5d"
#
# [*av_scanner*]
#   Configure your av-scanner here
#   Type: string
#   Example: "clamd:/var/run/clamav/clamd.ctl"
#
# [*callout_domain_positive_expire*]
#   SMTP callouts are cached, this options sets the time after a successfull
#   callout is deleted from the cache.
#   Type: string
#   Example: "4h"
#
# [*check_spool_space*]
#   Don't accept mails, if spool space falls below this watermark.
#   Type: string
#   Example: 1G
#
# [*chunink_advertise_hosts*]
#   advertise CHUNKING to these hosts
#   Type: array
#   Example: ['10.0.0.1', '192.168.178.1']
#
# [*config_path*]
#   Path to exims config file, this can be used to create an alternate config file
#   for testing purposes.
#   Type: string
#   Example: "/etc/exim4/exim4.conf_test"
#
# [*daemon_smtp_ports*]
#   SMTP ports to listen on
#   Type: array
#   Example: ['25','587']
#
# [*defaults*]
#   Use a default configuration, this creates a simple default config,
#   which accepts local mails and forwards it to mail.<domain of your server>
#   You probably want to set this to false, and build your own config.
#   Type: bool
#   Default: true
#
# [*delay_warning*]
#   Send a warning Mail to the sender, if mails are delayed for this long:
#   Type: Array
#   Example: ['4h','8h','24h']
#
# [*deliver_queue_load_max*]
#   Stop running the queue if load is higher than this value
#   Type: integer
#
# [*disable_ipv6*]
#   Do no IPv6 processing
#   Type: bool
#
# [*errors_reply_to*]
#   This sets a mail-address to be used in the reply-to header of bounce-messages.
#   Type: String
#   Example: postmaster@example.com
#
# [*extract_addresses_remove_arguments*]
#   When using exims -t option, rcpts from the Mail-Headers are used, and rcpts given
#   on the command-line are substracted, setting this to false will add the rcpts instead
#   of substracting them
#
# [*freeze_tell*]
#   If a mail gets frozen, send a notification to the address defined here.
#
# [*gnutls_compat_mode*]
#   This controls if gnutls is used in compatiblity mode.
#   Set this to true to slightly reduce security, but improve compatiblity with older
#   TLS implementations.
#   Type: bool
#
# [*openssl_options*]
#   Adjust OpenSSL compatibility options.
#   Type: String
#
# [*heavy*]
#   Install the debian heavy variant, default is false
#   does nothing for redhat
#
# [*helo_allow_chars*]
#   Allow additional characters in remote HELO strings.
#   Type: string
#
# [*host_lookup*]
#   Reverse lookup hostname of ips.
#   Type: Array
#   Example: '*'
#
# [*hosts_treat_as_local*]
#   Treat these hosts, as if they where the local host.
#   default is empty
#
# [*ignore_bounce_errors_after*]
#   Discard undeliverable bounce messages after this time
#   Type String:
#   Example: "12d"
#
# [*includes*]
#   Include additional config file snippets, files defined here will be included at
#   the top of the configuration, but below macros.
#
# [*local_from_check*]
#   Check and correct From: header from local mails to username@qualify-domain
#
# [*local_interfaces*]
#   Specifies the interfaces exim will listen on.
#
# [*log_file_path*']
#   Type: string
#
# [*log_lost_incoming_connection*]
#   Configures the log_selector to log timeouting incomming connections
#
# [*log_retry_defer*]
#   Configures the log_selector to log if the queue runner skips a mail
#   because it's retry time is not yet reached.
#
# [*log_sender_on_delivery*]
#   add sender to => lines
#
# [*log_skip_delivery*]
#   delivery skipped in a queue run
#
# [*log_smtp_confirmation*]
#   SMTP confirmation on => lines
#
# [*log_smtp_connection*]
#   Log SMTP connections.
#
# [*log_smtp_protocol_error*]
#   Log SMTP protocol errors.
#
# [*log_smtp_syntax_error*]
#   Log SMTP syntax errors.
#
# [*log_tls_peerdn*]
#   TLS peer DN on <= and => lines
#
# [*log_mail_subject*]
#   Log mail subjects.
#
# [*log_8bitmime*] 
#   received 8BITMIME status
#
# [*log_acl_warn_skipped*]
#   skipped warn statement in ACL
#
# [*log_address_rewrite*]           
#   address rewriting
#
# [*log_all_parents*]            
#   all parents in => lines
#
# [*log_arguments*]                
#   command line arguments
#
# [*log_connection_reject*]
#   connection rejections
#
# [*log_delay_delivery*]          
#   immediate delivery delayed
#
# [*log_deliver_time*]             
#   time taken to perform delivery
#
# [*log_delivery_size*]               
#   add S=nnn to => lines
#
# [*log_dnslist_defer*]              
#   defers of DNS list (aka RBL) lookups
#
# [*log_dnssec*]              
#   DNSSEC secured lookups
#
# [*log_etrn*]                     
#   ETRN commands
#
# [*log_host_lookup_failed*]
#   Log failed host lookup
#
# [*log_ident_timeout*]         
#   timeout for ident connection
#
# [*log_incoming_interface*]
#   local interface on <= and => lines
#
# [*log_incoming_port*]         
#   remote port on <= lines
#
# [*log_millisec*]              
#   millisecond timestamps and QT,DT,D times
#
# [*log_outgoing_interface*]
#   local interface on => lines
#
# [*log_outgoing_port*]         
#   add remote port to => lines
#
# [*log_queue_run*]              
#   start and end queue runs
#
# [*log_queue_time*]                  
#   time on queue for one recipient
#
# [*log_queue_time_overall*]
#   time on queue for whole message
#
# [*log_pid*]         
#   Exim process id
#
# [*log_proxy*]
#   proxy address on <= and => lines
#
# [*log_received_recipients*]
#   recipients on <= lines
#
# [*log_received_sender*]        
#   sender on <= lines
#
# [*log_rejected_header*]            
#   header contents on reject log
#
# [*log_return_path_on_delivery*]
#   put return path on => and ** lines
#
# [*log_sender_verify_fail*]    
#   sender verification failures
#
# [*log_size_reject*]         
#   rejection because too big
#
# [*log_smtp_incomplete_transaction*]
#   incomplete SMTP transactions
#
# [*log_smtp_mailauth*]
#   AUTH argument to MAIL commands
#
# [*log_smtp_no_mail*]              
#   session with no MAIL commands
#
# [*log_tls_certificate_verified*]
#   certificate verification status
#
# [*log_tls_cipher*]   
#   TLS cipher suite on <= and => lines
#
# [*log_tls_sni*]                 
#   TLS SNI on <= lines
#
# [*log_unknown_in_list*]
#   DNS lookup failed in list match
#
# [*macros*]
#   Allows you to set Macro definitions, note that macros must
#   start with an uppercase letter
#
# [*manage_service*]
#   Manage exim Service
#
# [*message_logs*]
#   This stores an aditional log file with each message in the spool file
#   which enables you to instantly get all logs from a message in your
#   queue by using the exim -Mvl option.
#
# [*message_size_limit*]
#   Max size allowed for mails, default is empty
#   Example: 100M
#
# [*never_users*]
#   Do not run deliverys as these users
#   Type: array
#
# [*qualify_domain*]
#   configure the domain, which is automatically added to email addresses
#   without a domain part. Default is empty, which exim treats as the
#   primary hostname.
#
# [*queue_only_load*]
#   Do not run imediate deliveries if load is above this threshhold.
#   Type: integer
#
# [*queue_run_max*]
#   Limits the number of queue runners to run in parrallel.
#   Type: integer
#
# [*remote_max_parallel*]
#   If one message with multiple recipients is delivered, run at max these
#   deliveries in parallel.
#
# [*rfc1413_hosts*]
#   use identd callback on these hosts.
#   Type: array
#
# [*rfc1413_query_timeout*]
#   Timeout for identd callback
#
# [*smtp_accept_max*]
#   Limit on incomming connections
#   Type: integer
#
# [*smtp_accept_max_nonmail*]
#   Limit the amount of non-mail commands in smtp dialog
#   Type: integer
#
# [*smtp_accept_max_per_connection*]
#   Maximum number of Mails accepted in a single connection.
#
# [*smtp_accept_max_per_host*]
#   Maximum number of parrallel connections from a single host
#
# [*smtp_accept_queue*]
#   If the number of simultaneous incoming SMTP connections being handled via the
#   listening daemon exceeds this value, messages received by SMTP are just
#   placed on the queue.
#
# [*smtp_accept_queue_per_connection*]
#   Maximum number of delivery processes spawned for a single smtp connection
#
# [*smtp_accept_reserve*]
#   When smtp_accept_max is set greater than zero, this option specifies a number
#   of SMTP connections that are reserved for connections from the hosts that
#   are specified in smtp_reserve_hosts.
#
# [*smtp_banner*]
#   Initial response to SMTP connections.
#
# [*smtp_reserve_hosts*]
#   See "smtp_accept_reserve"
#
# [*spamd_address*]
#   Configure a spamd socket here.
#
# [*split_spool_directory*]
#   Use split spool configuration
#   Type: bool
#
# [*syslog_timestamp*]
#   Don't send timestamps to syslog.
#
# [*system_filter*]
#   Configure a system filter file here.
#
# [*timeout_frozen_after*]
#   Discard frozen mails after this amount of time.
#
# [*tls_advertise_hosts*]
#   Advertise tls to hosts in this list
#
# [*tls_certificate*]
#   Path to crt file, must be used together with tls_privatekey, default is empty (no tls)
#
# [*tls_privatekey*]
#   Path to key file, must be used together with tls_certificate, default is empty (no tls)
#
# [*trusted_users*]
#   Set, to configure exims global config variable trusted_users,
#   default is empty ('').
#
# [*print_topbitchars*]
#   If this option ist set to true code values of 128 and above are also considered to be printing characters
#
# [*untrusted_set_sender*]
#   This option allows you to permit untrusted users to set other envelope sender addresses in a controlled way.
#
# [*tls_require_ciphers*]
#   This option controls which ciphers can be used for incoming TLS connections.
#
# === Examples
#  class { 'noris_exim':
#  }

class exim (
  Optional[String] $acl_not_smtp,
  Optional[String] $acl_smtp_auth,
  Optional[String] $acl_smtp_data,
  Optional[String] $acl_smtp_mail,
  Optional[String] $acl_smtp_mime,
  $acl_smtp_rcpt,
  $allow_mx_to_ip,
  Optional[String] $auto_thaw,
  Optional[String] $av_scanner,
  Optional[String] $callout_domain_positive_expire,
  Optional[String] $check_spool_space,
  Optional[Array[String]] $chunking_advertise_hosts,
  $config_path,
  Optional[Array[Integer]] $daemon_smtp_ports,
  $defaults,
  Optional[Array[String]] $delay_warning,
  Optional[Integer] $deliver_queue_load_max,
  Optional[Boolean] $disable_ipv6,
  Optional[String] $errors_reply_to,
  Optional[Boolean] $extract_addresses_remove_arguments,
  Optional[String] $freeze_tell,
  Optional[Boolean] $gnutls_compat_mode,
  Optional[String] $openssl_options,
  Optional[Boolean] $heavy,
  Optional[String] $helo_allow_chars,
  $host_lookup,
  Optional[Array[String]] $hosts_treat_as_local,
  $ignore_bounce_errors_after,
  $includes,
  Optional[Array[String]] $ldap_default_servers,
  $local_from_check,
  Optional[Array[String]] $local_interfaces,
  Optional[Array[String]] $log_file_path,
  $log_lost_incoming_connection,
  $log_retry_defer,
  $log_sender_on_delivery,
  $log_skip_delivery,
  $log_smtp_confirmation,
  $log_smtp_connection,
  $log_smtp_protocol_error,
  $log_smtp_syntax_error,
  $log_tls_peerdn,
  Optional[Boolean] $log_mail_subject,
  Optional[Boolean] $log_8bitmime,
  Optional[Boolean] $log_acl_warn_skipped,
  Optional[Boolean] $log_address_rewrite,
  Optional[Boolean] $log_all_parents,
  Optional[Boolean] $log_arguments,
  Optional[Boolean] $log_connection_reject,
  Optional[Boolean] $log_delay_delivery,
  Optional[Boolean] $log_deliver_time,
  Optional[Boolean] $log_delivery_size,
  Optional[Boolean] $log_dnslist_defer,
  Optional[Boolean] $log_dnssec,
  Optional[Boolean] $log_etrn,
  Optional[Boolean] $log_host_lookup_failed,
  Optional[Boolean] $log_ident_timeout,
  Optional[Boolean] $log_incoming_interface,
  Optional[Boolean] $log_incoming_port,
  Optional[Boolean] $log_millisec,
  Optional[Boolean] $log_outgoing_interface,
  Optional[Boolean] $log_outgoing_port,
  Optional[Boolean] $log_queue_run,
  Optional[Boolean] $log_queue_time,
  Optional[Boolean] $log_queue_time_overall,
  Optional[Boolean] $log_pid,
  Optional[Boolean] $log_proxy,
  Optional[Boolean] $log_received_recipients,
  Optional[Boolean] $log_received_sender,
  Optional[Boolean] $log_rejected_header,
  Optional[Boolean] $log_return_path_on_delivery,
  Optional[Boolean] $log_sender_verify_fail,
  Optional[Boolean] $log_size_reject,
  Optional[Boolean] $log_smtp_incomplete_transaction,
  Optional[Boolean] $log_smtp_mailauth,
  Optional[Boolean] $log_smtp_no_mail,
  Optional[Boolean] $log_timezone,
  Optional[Boolean] $log_tls_certificate_verified,
  Optional[Boolean] $log_tls_cipher,
  Optional[Boolean] $log_tls_sni,
  Optional[Boolean] $log_unknown_in_list,
  $macros,
  $manage_service,
  Optional[Boolean] $message_logs,
  Optional[String] $message_size_limit,
  $never_users,
  Optional[Boolean] $untrusted_set_sender,
  $print_topbitchars,
  Optional[String] $tls_require_ciphers,
  Optional[String] $qualify_domain,
  Optional[Integer] $queue_only_load,
  Optional[Integer] $queue_run_max,
  Optional[Integer] $remote_max_parallel,
  $rfc1413_hosts,
  $rfc1413_query_timeout,
  Optional[Integer] $smtp_accept_max,
  Optional[Integer] $smtp_accept_max_nonmail,
  Optional[Integer] $smtp_accept_max_per_connection,
  Optional[Integer] $smtp_accept_max_per_host,
  Optional[Integer] $smtp_accept_queue,
  Optional[Integer] $smtp_accept_queue_per_connection,
  Optional[Integer] $smtp_accept_reserve,
  Optional[String] $smtp_banner,
  Optional[Array[String]] $smtp_reserve_hosts,
  Optional[String] $spamd_address,
  Optional[Boolean] $split_spool_directory,
  Optional[Boolean] $syslog_timestamp,
  Optional[String] $system_filter,
  Optional[String] $timeout_frozen_after,
  Optional[Array[String]] $tls_advertise_hosts,
  Optional[String] $tls_certificate,
  Optional[String] $tls_privatekey,
  Optional[Array[String]] $trusted_users,
  Optional[String] $exim_light_package,
  Optional[String] $exim_heavy_package,
) {

  class {'exim::install':}
  -> class {'exim::config': }
  ~> class {'exim::service':}
}
