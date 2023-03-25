task :send_notification => [ :environment ] do
  client = Exponent::Push::Client.new

  highlight = Highlight.where(sent: false).sample

  unless highlight
    Highlight.update_all(sent: false)
    highlight = Highlight.all.sample
  end

  highlight.update(sent: true)

  messages = [{
    to: "ExponentPushToken[5HXOyQDCUnIudGLyfhBFAN]",
    sound: "default",
    title: "QOTD!",
    body: highlight.text,
    badge: 1,
    data: highlight
  }]

  handler = client.send_messages(messages)
end
