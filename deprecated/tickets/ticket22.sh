#!/bin/sh
# to get time in milliseconds
echo date +%s

# uci set firewall.cfg1092bd.ac_suspend='1661946061'
# uci set firewall.cfg1092bd.ac_suspend=$(date +Xs)

ticket_start=$(date +%s)
echo ticket_start $ticket_start

ticket_dur=10
echo ticket_dur $ticket_dur

ticket_end=$((ticket_start + $((ticket_dur * 60))))
echo ticket_end $ticket_end

uci set firewall.cfg1492bd.ac_suspend=$ticket_end
echo uci set firewall.cfg1492bd.ac_suspend=$ticket_end

# uci commit
# reload_config

# num=$((num1 + num2))
# $(date +%s
