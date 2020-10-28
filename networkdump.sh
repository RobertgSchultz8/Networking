#Creates our file if we don't have one
#Also includes date script was run
output=networkinfo"$(date +"%Y_%m_%d")".txt
#Writes Ip address
#Does not append to file
#Essentially overwrites an old version of the file with a new one
#This would only matter if this was run multiple times in one day
hostname -I | tee $output
#Writes dns info
#This does append to file
cat /etc/resolv.conf | tee -a $output
#Writes info on open ports
#Info includes process that opened sockets
#This too appends to file
netstat -tulp | grep LISTEN | tee -a $output
