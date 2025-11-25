# RouterOS 7.20.4
# Original idea: @Kentzo, Mikrotik Forum

/ip/firewall/filter/

#forward chain:
add action=jump chain=forward comment="custom: evaluate invalid forward" connection-state=invalid jump-target=invalidforward

#invalidforward chain:
add action=accept chain=invalidforward in-interface-list=LAN protocol=tcp tcp-flags=rst comment=INVALID-FORWARD
add action=accept chain=invalidforward in-interface-list=LAN protocol=tcp tcp-flags=fin,ack
add action=reject chain=invalidforward in-interface-list=LAN protocol=tcp reject-with=tcp-reset
add action=reject chain=invalidforward in-interface-list=LAN reject-with=icmp-admin-prohibited
add action=drop chain=invalidforward
