every 1.minute do
  rake 'send_notification'
  rake 'ping_door_man'
end
