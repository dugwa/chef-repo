name "jenkins-master"
description "This role contains nodes, which act as jenkins master"
run_list "recipe[jenkins]", "recipe[jenkins::rsync]"
