#!/bin/bash
for i in `cat live`
 do
 echo $i;  ssh -o ConnectTimeout=5 -o StrictHostKeyChecking=no $i "uname -n;" 
	done
