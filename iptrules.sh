#!/bin/sh

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

## Allow private subnets ##
iptables -A INPUT -p tcp --dport ssh -s 10.0.0.0/8 -j ACCEPT -m comment --comment "Private A"
iptables -A INPUT -p tcp --dport ssh -s 172.16.0.0/12 -j ACCEPT -m comment --comment "Private B"
iptables -A INPUT -p tcp --dport ssh -s 192.168.0.0/16 -j ACCEPT -m comment --comment "Private C"

## Allow Belgian subnets ##
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 5.23.128.0-5.23.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 07/05/12"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 31.31.128.0-31.31.159.255 -j ACCEPT -m comment --comment "Citymesh NV -- 18/03/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 37.62.0.0-37.62.255.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 20/01/12"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 37.184.0.0-37.185.255.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 19/03/12"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 46.178.0.0-46.179.255.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 07/12/10"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 46.253.160.0-46.253.175.255 -j ACCEPT -m comment --comment "Coditel -- 14/01/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.4.128.0-62.4.159.255 -j ACCEPT -m comment --comment "BELGACOM -- 08/12/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.4.160.0-62.4.191.255 -j ACCEPT -m comment --comment "BELGACOM -- 09/05/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.4.192.0-62.4.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 09/05/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.58.0.0-62.59.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 15/06/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.88.0.0-62.88.127.255 -j ACCEPT -m comment --comment "Euphony Benelux n.v. -- 23/01/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.112.0.0-62.112.31.255 -j ACCEPT -m comment --comment "Online Internet nv/sa -- 02/05/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.166.0.0-62.166.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 27/07/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.197.64.0-62.197.127.255 -j ACCEPT -m comment --comment "Brutele SC -- 30/10/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.205.64.0-62.205.127.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 01/11/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.213.192.0-62.213.255.255 -j ACCEPT -m comment --comment "Kangaroot BVBA -- 31/01/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.233.0.0-62.233.31.255 -j ACCEPT -m comment --comment "Getronics Belgium NV / SA -- 20/07/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 62.235.0.0-62.235.255.255 -j ACCEPT -m comment --comment "Scarlet -- 02/01/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 77.241.80.0-77.241.95.255 -j ACCEPT -m comment --comment "COMBELL GROUP NV -- 02/02/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 78.20.0.0-78.23.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 14/05/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 78.29.192.0-78.29.255.255 -j ACCEPT -m comment --comment "Coditel -- 27/09/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 78.110.192.0-78.110.207.255 -j ACCEPT -m comment --comment "e-leven sa -- 17/08/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 78.129.0.0-78.129.127.255 -j ACCEPT -m comment --comment "Brutele SC -- 17/04/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 79.132.224.0-79.132.255.255 -j ACCEPT -m comment --comment "EDPNET -- 01/10/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 80.65.128.0-80.65.143.255 -j ACCEPT -m comment --comment "ASP.be SA -- 15/05/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 80.66.128.0-80.66.143.255 -j ACCEPT -m comment --comment "Sprintlink Belgium bvba -- 16/05/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 80.88.32.0-80.88.47.255 -j ACCEPT -m comment --comment "SONY ITE a division of SONY Service Europe Center -- 28/08/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 80.91.144.0-80.91.159.255 -j ACCEPT -m comment --comment "MAC Telecom S.A. -- 14/06/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 80.200.0.0-80.201.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 08/11/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 80.236.128.0-80.236.255.255 -j ACCEPT -m comment --comment "Scarlet -- 31/10/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.11.128.0-81.11.255.255 -j ACCEPT -m comment --comment "Scarlet -- 13/05/02"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.58.0.0-81.59.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 28/11/02"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.82.0.0-81.83.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 29/04/02"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.95.112.0-81.95.127.255 -j ACCEPT -m comment --comment "lcp nv -- 22/05/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.164.0.0-81.165.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 01/05/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.169.0.0-81.169.127.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 10/04/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.188.0.0-81.188.255.255 -j ACCEPT -m comment --comment "Easynet Belgium -- 18/02/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.201.80.0-81.201.95.255 -j ACCEPT -m comment --comment "Voxbone -- 20/06/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.240.0.0-81.243.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 29/11/02"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 81.244.0.0-81.247.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 29/11/02"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 82.143.64.0-82.143.127.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 11/09/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 82.146.96.0-82.146.127.255 -j ACCEPT -m comment --comment "XS4ALL Belgium NV -- 19/06/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 82.212.128.0-82.212.191.255 -j ACCEPT -m comment --comment "Brutele SC -- 16/10/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 83.101.0.0-83.101.127.255 -j ACCEPT -m comment --comment "schedom vof -- 24/02/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 83.134.0.0-83.134.255.255 -j ACCEPT -m comment --comment "Scarlet -- 22/01/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 83.217.64.0-83.217.95.255 -j ACCEPT -m comment --comment "Easyhost BVBA -- 05/03/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 83.217.128.0-83.217.159.255 -j ACCEPT -m comment --comment "Coditel -- 08/03/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 84.17.128.0-84.17.159.255 -j ACCEPT -m comment --comment "Wallonie Data Center SA -- 27/07/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 84.192.0.0-84.199.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 21/04/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.10.64.0-85.10.127.255 -j ACCEPT -m comment --comment "Euphony Benelux n.v. -- 21/02/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.26.0.0-85.26.127.255 -j ACCEPT -m comment --comment "Brutele SC -- 09/03/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.27.0.0-85.27.127.255 -j ACCEPT -m comment --comment "Brutele SC -- 18/03/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.28.64.0-85.28.127.255 -j ACCEPT -m comment --comment "Coditel -- 29/04/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.88.32.0-85.88.63.255 -j ACCEPT -m comment --comment "EUSIP bvba -- 22/10/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.91.160.0-85.91.191.255 -j ACCEPT -m comment --comment "SmalS-MvM -- 24/11/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.201.0.0-85.201.255.255 -j ACCEPT -m comment --comment "Brutele SC -- 11/01/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.234.192.0-85.234.223.255 -j ACCEPT -m comment --comment "EDPNET -- 03/05/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 85.255.192.0-85.255.207.255 -j ACCEPT -m comment --comment "UNKNOWN -- 11/08/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 86.39.0.0-86.39.127.255 -j ACCEPT -m comment --comment "Tigron BVBA -- 23/05/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 86.39.128.0-86.39.255.255 -j ACCEPT -m comment --comment "Easyhost BVBA -- 23/05/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 87.64.0.0-87.67.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 19/05/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 88.82.32.0-88.82.63.255 -j ACCEPT -m comment --comment "e-leven sa -- 16/12/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 88.147.0.0-88.147.127.255 -j ACCEPT -m comment --comment "b.lite Telecom SPRL/BVBA -- 06/01/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 88.197.128.0-88.197.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 14/02/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 91.86.0.0-91.87.255.255 -j ACCEPT -m comment --comment "Mobistar SA -- 15/08/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 91.176.0.0-91.183.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 04/09/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 91.185.128.0-91.185.159.255 -j ACCEPT -m comment --comment "Rackboost NV -- 25/10/06"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 92.48.128.0-92.48.191.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 14/11/07"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 94.104.0.0-94.111.255.255 -j ACCEPT -m comment --comment "MOBISTAR ENTERPRISE SERVICES SA -- 20/06/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 94.139.32.0-94.139.63.255 -j ACCEPT -m comment --comment "Alpha Networks S.P.R.L. -- 13/11/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 94.140.160.0-94.140.191.255 -j ACCEPT -m comment --comment "Destiny N.V -- 04/12/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 94.224.0.0-94.227.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 18/09/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 95.171.160.0-95.171.191.255 -j ACCEPT -m comment --comment "Belgian Network Solutions -- 25/02/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 95.182.128.0-95.182.255.255 -j ACCEPT -m comment --comment "Brutele SC -- 06/02/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 109.88.0.0-109.89.255.255 -j ACCEPT -m comment --comment "Brutele SC -- 01/09/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 109.128.0.0-109.143.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 27/07/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 109.236.128.0-109.236.143.255 -j ACCEPT -m comment --comment "EDPNET -- 14/12/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 130.104.0.0-130.104.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 19/07/88"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 134.54.0.0-134.54.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/09/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 134.58.0.0-134.58.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 17/09/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 134.184.0.0-134.184.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 06/07/89"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 138.48.0.0-138.48.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 06/02/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 138.203.0.0-138.203.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 29/05/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 138.205.0.0-138.205.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 29/05/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 139.10.0.0-139.10.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/09/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 139.90.0.0-139.90.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 12/02/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 139.165.0.0-139.165.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 24/03/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 141.96.0.0-141.96.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 02/03/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 141.134.0.0-141.135.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 20/06/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 141.138.64.0-141.138.79.255 -j ACCEPT -m comment --comment "ITAF bvba -- 30/06/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 141.253.0.0-141.253.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 22/08/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 143.129.0.0-143.129.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 19/09/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 143.169.0.0-143.169.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 26/09/90"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 144.248.0.0-144.248.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 15/01/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 146.103.0.0-146.103.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 23/10/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 146.175.0.0-146.175.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 22/02/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 147.93.0.0-147.93.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 19/07/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 149.134.0.0-149.134.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 30/04/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 149.154.192.0-149.154.255.255 -j ACCEPT -m comment --comment "Brutele SC -- 05/08/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 150.158.0.0-150.158.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 20/05/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 150.251.0.0-150.251.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 19/08/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 152.152.0.0-152.152.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 04/09/91"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 157.164.0.0-157.164.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 07/04/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 157.193.0.0-157.193.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 07/04/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 160.221.0.0-160.221.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 05/04/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 161.59.0.0-161.59.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 02/06/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 163.163.0.0-163.163.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 27/08/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 163.165.0.0-163.165.191.255 -j ACCEPT -m comment --comment "UNKNOWN -- 27/08/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 164.15.0.0-164.15.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 07/01/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 164.35.0.0-164.35.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 20/10/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 170.205.64.0-170.205.127.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/12/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 170.205.128.0-170.205.191.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/12/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 170.255.0.0-170.255.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/01/84"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 171.26.0.0-171.26.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 14/11/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 176.62.160.0-176.62.175.255 -j ACCEPT -m comment --comment "COMBELL GROUP NV -- 09/06/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 178.50.0.0-178.50.255.255 -j ACCEPT -m comment --comment "Mobistar SA -- 28/12/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 178.51.0.0-178.51.255.255 -j ACCEPT -m comment --comment "Mobistar SA -- 21/07/10"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 178.116.0.0-178.119.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 22/01/10"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 178.144.0.0-178.145.255.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 03/03/10"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 178.208.32.0-178.208.63.255 -j ACCEPT -m comment --comment "COMBELL GROUP NV -- 03/03/10"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 188.5.0.0-188.5.255.255 -j ACCEPT -m comment --comment "Belgacom Mobile SA/NV -- 17/02/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 188.44.64.0-188.44.95.255 -j ACCEPT -m comment --comment "Coditel -- 04/10/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 188.118.0.0-188.118.63.255 -j ACCEPT -m comment --comment "Destiny N.V -- 18/06/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 188.126.96.0-188.126.127.255 -j ACCEPT -m comment --comment "THYNX -- 23/07/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 188.188.0.0-188.189.255.255 -j ACCEPT -m comment --comment "KPN Group Belgium NV/SA -- 22/06/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.22.224.0-193.22.239.255 -j ACCEPT -m comment --comment "UNKNOWN -- 29/07/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.53.48.0-193.53.63.255 -j ACCEPT -m comment --comment "UNKNOWN -- 18/04/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.53.64.0-193.53.79.255 -j ACCEPT -m comment --comment "UNKNOWN -- 18/04/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.53.128.0-193.53.159.255 -j ACCEPT -m comment --comment "UNKNOWN -- 18/04/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.53.170.0-193.53.199.255 -j ACCEPT -m comment --comment "UNKNOWN -- 18/04/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.53.200.0-193.53.244.255 -j ACCEPT -m comment --comment "UNKNOWN -- 18/04/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.58.16.0-193.58.35.255 -j ACCEPT -m comment --comment "UNKNOWN -- 11/07/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.58.48.0-193.58.63.255 -j ACCEPT -m comment --comment "UNKNOWN -- 11/07/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.58.96.0-193.58.120.255 -j ACCEPT -m comment --comment "UNKNOWN -- 11/07/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.74.0.0-193.74.255.255 -j ACCEPT -m comment --comment "Scarlet -- 01/09/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.75.128.0-193.75.255.255 -j ACCEPT -m comment --comment "Scarlet -- 13/05/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.91.96.0-193.91.127.255 -j ACCEPT -m comment --comment "Scarlet -- 24/10/95"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.121.0.0-193.121.31.255 -j ACCEPT -m comment --comment "Scarlet -- 26/05/95"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.121.32.0-193.121.63.255 -j ACCEPT -m comment --comment "Scarlet -- 08/05/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.121.64.0-193.121.127.255 -j ACCEPT -m comment --comment "Scarlet -- 08/05/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.121.128.0-193.121.255.255 -j ACCEPT -m comment --comment "Scarlet -- 08/05/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.190.0.0-193.190.255.255 -j ACCEPT -m comment --comment "BELNET -- 01/09/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.191.0.0-193.191.255.255 -j ACCEPT -m comment --comment "BELNET -- 01/09/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.221.0.0-193.221.15.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/09/93"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.221.160.0-193.221.191.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/07/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.221.224.0-193.221.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/01/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 193.244.0.0-193.245.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 20/10/92"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 194.7.0.0-194.7.255.255 -j ACCEPT -m comment --comment "NV Verizon Belgium Luxembourg SA -- 11/01/95"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 194.41.96.0-194.41.111.255 -j ACCEPT -m comment --comment "UNKNOWN -- 01/06/94"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 194.78.0.0-194.78.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 13/02/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 194.88.96.0-194.88.127.255 -j ACCEPT -m comment --comment "Online Internet nv/sa -- 23/07/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 194.119.224.0-194.119.255.255 -j ACCEPT -m comment --comment "Scarlet -- 02/07/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 194.183.224.0-194.183.255.255 -j ACCEPT -m comment --comment "Perceval S.A. -- 20/12/95"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.0.0.0-195.0.127.255 -j ACCEPT -m comment --comment "Scarlet -- 03/04/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.13.0.0-195.13.31.255 -j ACCEPT -m comment --comment "BELGACOM -- 04/10/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.16.0.0-195.16.31.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 16/04/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.72.64.0-195.72.95.255 -j ACCEPT -m comment --comment "UNKNOWN -- 24/01/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.74.192.0-195.74.223.255 -j ACCEPT -m comment --comment "Scarlet -- 18/04/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.95.0.0-195.95.127.255 -j ACCEPT -m comment --comment "Scarlet -- 03/03/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.122.96.0-195.122.127.255 -j ACCEPT -m comment --comment "ISABEL N.V. -- 05/09/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.130.128.0-195.130.159.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 27/11/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.144.64.0-195.144.95.255 -j ACCEPT -m comment --comment "XS4ALL Belgium NV -- 12/03/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.162.192.0-195.162.223.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 29/04/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.184.128.0-195.184.159.255 -j ACCEPT -m comment --comment "UNKNOWN -- 10/10/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.207.0.0-195.207.255.255 -j ACCEPT -m comment --comment "Scarlet -- 22/09/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.213.0.0-195.213.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 25/09/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.238.0.0-195.238.31.255 -j ACCEPT -m comment --comment "UNKNOWN -- 19/09/96"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 195.244.160.0-195.244.191.255 -j ACCEPT -m comment --comment "CIRB-CIBG -- 08/10/97"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.53.0.0-212.53.15.255 -j ACCEPT -m comment --comment "MOBISTAR ENTERPRISE SERVICES SA -- 29/09/09"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.53.16.0-212.53.31.255 -j ACCEPT -m comment --comment "UNKNOWN -- 03/04/98"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.63.224.0-212.63.255.255 -j ACCEPT -m comment --comment "Dexia Bank Belgium SA -- 20/09/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.65.32.0-212.65.63.255 -j ACCEPT -m comment --comment "Mobistar SA -- 14/06/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.68.192.0-212.68.223.255 -j ACCEPT -m comment --comment "Brutele SC -- 23/04/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.68.224.0-212.68.255.255 -j ACCEPT -m comment --comment "Brutele SC -- 08/02/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.71.0.0-212.71.31.255 -j ACCEPT -m comment --comment "EDPNET -- 28/10/98"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.76.224.0-212.76.255.255 -j ACCEPT -m comment --comment "Coditel -- 23/05/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.79.64.0-212.79.95.255 -j ACCEPT -m comment --comment "Portima -- 02/02/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.87.96.0-212.87.127.255 -j ACCEPT -m comment --comment "Euphony Benelux n.v. -- 13/05/04"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.88.224.0-212.88.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 22/05/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.100.160.0-212.100.191.255 -j ACCEPT -m comment --comment "Easynet Belgium -- 12/07/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.105.128.0-212.105.159.255 -j ACCEPT -m comment --comment "Pietercil Delby's NV -- 21/12/98"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.113.64.0-212.113.95.255 -j ACCEPT -m comment --comment "HostIt NV -- 10/02/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.123.0.0-212.123.31.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 13/11/98"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.166.0.0-212.166.63.255 -j ACCEPT -m comment --comment "WIN S.A. -- 23/02/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.190.0.0-212.190.255.255 -j ACCEPT -m comment --comment "NV Verizon Belgium Luxembourg SA -- 04/03/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.221.0.0-212.221.127.255 -j ACCEPT -m comment --comment "UNKNOWN -- 07/08/98"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.224.128.0-212.224.255.255 -j ACCEPT -m comment --comment "Mobistar SA -- 14/09/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.233.0.0-212.233.31.255 -j ACCEPT -m comment --comment "Scarlet -- 17/09/98"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 212.239.128.0-212.239.255.255 -j ACCEPT -m comment --comment "Scarlet -- 04/11/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.31.0.0-213.31.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 27/03/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.49.0.0-213.49.255.255 -j ACCEPT -m comment --comment "Scarlet -- 19/11/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.118.0.0-213.119.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 07/09/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.132.128.0-213.132.159.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 24/01/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.177.64.0-213.177.95.255 -j ACCEPT -m comment --comment "CYBERNET SA -- 22/03/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.177.128.0-213.177.159.255 -j ACCEPT -m comment --comment "Scarlet -- 08/02/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.177.160.0-213.177.191.255 -j ACCEPT -m comment --comment "WIS Telecom SA -- 22/06/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.181.32.0-213.181.63.255 -j ACCEPT -m comment --comment "BELGACOM -- 19/01/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.189.160.0-213.189.191.255 -j ACCEPT -m comment --comment "Brutele SC -- 10/10/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.193.128.0-213.193.191.255 -j ACCEPT -m comment --comment "Easynet Belgium -- 23/05/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.211.128.0-213.211.191.255 -j ACCEPT -m comment --comment "EDPNET -- 02/08/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.213.192.0-213.213.255.255 -j ACCEPT -m comment --comment "Brutele SC -- 24/06/02"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.214.32.0-213.214.63.255 -j ACCEPT -m comment --comment "Coditel -- 28/03/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.219.128.0-213.219.191.255 -j ACCEPT -m comment --comment "EDPNET -- 30/08/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.224.0.0-213.224.31.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 14/07/99"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.224.32.0-213.224.63.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 14/01/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.224.64.0-213.224.127.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 14/01/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.224.128.0-213.224.255.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 21/06/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.246.192.0-213.246.255.255 -j ACCEPT -m comment --comment "UNKNOWN -- 19/03/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 213.251.64.0-213.251.127.255 -j ACCEPT -m comment --comment "Telenet N.V. -- 25/04/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.15.224.0-217.15.239.255 -j ACCEPT -m comment --comment "Brutele SC -- 05/08/11"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.16.32.0-217.16.47.255 -j ACCEPT -m comment --comment "UNKNOWN -- 11/09/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.19.224.0-217.19.239.255 -j ACCEPT -m comment --comment "COMBELL GROUP NV -- 29/03/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.21.176.0-217.21.191.255 -j ACCEPT -m comment --comment "COMBELL GROUP NV -- 06/10/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.22.48.0-217.22.63.255 -j ACCEPT -m comment --comment "Easyhost BVBA -- 13/02/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.30.16.0-217.30.31.255 -j ACCEPT -m comment --comment "Global Telephone & Telecommunication S.A. (GT&T) -- 23/05/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.64.240.0-217.64.255.255 -j ACCEPT -m comment --comment "MAC Telecom S.A. -- 17/06/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.66.0.0-217.66.15.255 -j ACCEPT -m comment --comment "ZEMBLAZ NV -- 03/11/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.70.224.0-217.70.239.255 -j ACCEPT -m comment --comment "Mondial Telecom SA -- 15/07/08"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.72.224.0-217.72.239.255 -j ACCEPT -m comment --comment "KPN Group Belgium NV/SA -- 12/12/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.76.224.0-217.76.239.255 -j ACCEPT -m comment --comment "IDnet bvba -- 30/11/00"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.112.176.0-217.112.191.255 -j ACCEPT -m comment --comment "BELCENTER SPRL -- 08/12/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.113.64.0-217.113.79.255 -j ACCEPT -m comment --comment "Gateway Communications -- 16/01/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.113.80.0-217.113.95.255 -j ACCEPT -m comment --comment "Gateway Communications -- 19/08/03"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.117.32.0-217.117.47.255 -j ACCEPT -m comment --comment "Network Research Belgium -- 06/02/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.117.48.0-217.117.63.255 -j ACCEPT -m comment --comment "Network Research Belgium -- 03/04/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.136.0.0-217.136.255.255 -j ACCEPT -m comment --comment "BELGACOM -- 25/01/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.145.32.0-217.145.47.255 -j ACCEPT -m comment --comment "Toledo Telecommunications SA -- 21/02/01"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.148.240.0-217.148.255.255 -j ACCEPT -m comment --comment "Mondial Telecom SA -- 17/05/05"
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 217.171.80.0-217.171.95.255 -j ACCEPT -m comment --comment "Global Broadband Solution societe de droit americain -- 24/08/04"

## Block everything else ##
iptables -A INPUT -p tcp --dport ssh -m iprange --src-range 0.0.0.0-255.255.255.255 -j DROP -m comment --comment "Default block all rest"
