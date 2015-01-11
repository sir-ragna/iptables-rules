

# Only allow national SSH connections #

Based upon IP ranges found at [http://www.nirsoft.net/countryip/be.html](nirSoft).
You can download the csv for your own country and modify the script.

The goal is to block all foreign IP traffic (on port 22).
This should stop the majority of brute force attackers.

The main reason for writing this script is because [http://www.belgacom.com](Belgacom)
 gives their customers shitty routers. After a night of heavy attacks 
from bruteforcers the thing would sometimes crash. Probably due to state table issues.
(And bring down television with it. Yay for digital tv tech that now relies on internet connection.)

It is because the issue lies at the router that SSH lockers are only partially effective.
I don't want these attackers to even know there is a connection possible on port 22.

## why no -i eth0 ##

I didn't specify a NIC because my network config tends to change.
It is however better if you specify the NIC.
If you don't, these rules will get checked for every interface and might cause more overhead than needed.

## usage ##

On Debian, if you'd like to apply these rules and make them persistent.

        ./iptrules.sh 
        iptables-save > /etc/iptables.up.rules 
        cat > /etc/network/if-pre-up.d/iptables << EOF
        #!/bin/sh
        /sbin/iptables-restore < /etc/iptables.up.rules
        EOF
        chmod +x /etc/network/if-pre-up.d/iptables

