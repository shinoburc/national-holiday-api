root = "/home/dot/work/rails/cal"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "#{root}/tmp/sockets/unicorn.sock"
worker_processes 2
timeout 30
