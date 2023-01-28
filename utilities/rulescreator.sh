#!/bin/sh

# uci del firewall.cfg1092bd.ac_suspend

uci add firewall rule # =cfg1092bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1192bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1292bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1392bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1492bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1592bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1692bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1792bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci add firewall rule # =cfg1892bd
uci set firewall.@rule[-1].ac_enabled='1'
uci set firewall.@rule[-1].mon='0'
uci set firewall.@rule[-1].tue='0'
uci set firewall.@rule[-1].wed='0'
uci set firewall.@rule[-1].thu='0'
uci set firewall.@rule[-1].fri='0'
uci set firewall.@rule[-1].sat='0'
uci set firewall.@rule[-1].sun='0'
uci set firewall.@rule[-1].enabled='0'
uci set firewall.@rule[-1].src='*'
uci set firewall.@rule[-1].dest='wan'
uci set firewall.@rule[-1].proto='0'
uci set firewall.@rule[-1].target='REJECT'
uci del firewall.@rule[-1].mon
uci del firewall.@rule[-1].tue
uci del firewall.@rule[-1].wed
uci del firewall.@rule[-1].thu
uci del firewall.@rule[-1].fri
uci del firewall.@rule[-1].sat
uci del firewall.@rule[-1].sun

uci commit
reload_config

