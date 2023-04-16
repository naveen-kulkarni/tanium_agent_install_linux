#!/bin/bash
srvName=$(uname -n)
osVer=$(cat /etc/redhat-release)
agentver=$(/opt/Tanium/TaniumClient/TaniumClient -v)


###agent stat check
agenntStat() {
ps -ef |grep -i tanium |grep -v grep &>/dev/null
       if  [ $? -eq 0 ]
        then
                local agentstat="Running"
               echo "$agentstat"
        else
                local agentstat="Not-Running"
                echo "$agentstat"

        fi

}

###agent install check
agenntInstall() {
        rpm -qa |grep -i tanium  &>/dev/null
       if  [ $? -eq 0 ]
        then
                local agent="Completed"
               echo "$agent"
        else
                local agent="Incompleted"
                echo "$agent"

        fi

}
echo -n $srvName  "=" | tr -d '\n'; echo -n $osVer  "=" | tr -d '\n'; echo -n $agentver "=" | tr -d '\n'; agenntInstall   | tr -d '\n';echo -n "=" | tr -d '\n';   agenntStat | tr -d '\r'


