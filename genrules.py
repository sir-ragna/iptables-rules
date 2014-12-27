#!/usr/bin/python3.4

print("""#!/bin/sh

## Make backup of previous config ##
iptables-save > /root/iptables-works-`date +%F+%H:%M`
# restore with
# `iptables-restore < iptables-dump-2014-04-13`

## Clear IP rules ##
iptables -F
iptables -X

## Default Policy ##
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
""")

local = [ [ '10.0.0.0', '8', 'Private A' ],
          [ '172.16.0.0', '12', 'Private B' ],
          [ '192.168.0.0', '16', 'Private C' ]
        ]

print("## Allow private subnets ##")
for iprange in local: 
  rule = 'iptables -A INPUT -p tcp --dport ssh -s {0}/{1} -j ACCEPT -m comment --comment "{2}"'.format(*iprange)
  print(rule)

print("\n## Allow Belgian subnets ##")

with open('be-ip-ranges.csv') as fh:
  lines = fh.readlines()
  for l in lines:
    s = l.strip().replace("\"", '')
    if s == "":
      continue
    iprange = s.split(',')
    if iprange[4] == '':
      iprange[4] = 'UNKNOWN'
    rule = 'iptables -A INPUT -p tcp --dport ssh -m iprange --src-range {0}-{1} -j ACCEPT -m comment --comment "{4} -- {3}"'.format(*iprange)
    print(rule)

print("\n## Block everything else ##")
print('iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 0.0.0.0-255.255.255.255 -j DROP -m comment --comment "Default block all rest"')


