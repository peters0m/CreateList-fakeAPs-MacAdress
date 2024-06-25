#!/bin/bash
if [ $1 == "-h" ]; then
   echo -e "\n *CREATE FAKE APs*\n  Git:pinscher666\n\n  usage: nmkfakeAPs <option> <[1~10]> <param>\n\n  Options:\n  -i <count>                 :input manual names\n  -r <count> <name>          :repeat the name several times"
   exit 0
elif [ $1 != "-r" ] && [ $1 != "-i" ] || [ $2 -gt 10 ] || [ $2 -lt 1 ]; then
   echo "invalid argument type 'mkfakeAps -h'"
   exit 0
fi

echo -n > listfakeAPs.txt

for((mac=1;mac<=$2;mac++));
do
  if((mac<10)); then
     echo -n "00:00:00:00:00:0$mac " >> listfakeAPs.txt
  elif((mac>9)); then
     echo -n "00:00:00:00:00:$mac " >> listfakeAPs.txt
  fi
  if [ $1 == "-i" ]; then
     echo -e "name($mac):"
     read _INPUT_STRING
     echo "$_INPUT_STRING" >> listfakeAPs.txt
  elif [ $1 == "-r" ]; then
     echo "$3$mac" >> listfakeAPs.txt
  else
     echo "fail not create list!"
     exit 0
  fi
done

echo "create list sucess!"
