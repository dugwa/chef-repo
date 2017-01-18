name "rails-test"
description "This role contains nodes, which we use for rails CI"
run_list "recipe[rails::install]"
