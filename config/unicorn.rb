worker_processes 2 # this should be >= nr_cpus
listen "/home/ubuntu/TwilioSupport/tmp/sockets/unicorn.sock"
pid "/home/ubuntu/TwilioSupport/tmp/pids/unicorn.pid"
stderr_path "/home/ubuntu/TwilioSupport/log/unicorn.log"
stdout_path "/home/ubuntu/TwilioSupport/log/unicorn.log"
