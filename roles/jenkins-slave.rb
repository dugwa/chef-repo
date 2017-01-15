name "jenkins-slave"
description "This role contains nodes, which act as jenkins slave"
run_list "recipe[iptables]", "recipe[jenkins]", "recipe[jenkins::rsync]"
