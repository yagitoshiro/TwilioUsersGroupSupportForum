worker_processes 2 # this should be >= nr_cpus
listen "/home/toshiro/TwilioUsersGroupSupportForum/tmp/sockets/unicorn.sock"
pid "/home/toshiro/TwilioUsersGroupSupportForum/tmp/pids/unicorn.pid"
stderr_path "/home/toshiro/TwilioUsersGroupSupportForum/log/unicorn.log"
stdout_path "/home/toshiro/TwilioUsersGroupSupportForum/log/unicorn.log"
