every 1.hour do
  rake 'send_notification'
  rake 'ping_door_man'
end
