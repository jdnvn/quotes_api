set :output, {:error => "log/cron_error_log.log", :standard => "log/cron_log.log"}

every 1.minute do
  rake 'send_notification'
  rake 'ping_door_man'
end
