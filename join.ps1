$ip = read-host "IP Address to set"
$adapter = get-netadapter | select -expand ifindex

New-netipaddress -ipaddress $ip -defaultgateway 10.25.25.1 -prefixlength 24 -interfaceindex $adapter
Set-dnsclientserveraddress -interfaceindex $adapter -serveraddresses 10.25.25.26,192.168.1.5

$name = read-host "Enter computer name"

Add-Computer -DomainName "15below.local" -OUPath "OU=BuildApp Servers,OU=RapidSwitch,DC=15below,DC=local" -newname $name credentials (get-credential) -server btn-dc04.15below.local
