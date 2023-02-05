task :send_notification => [ :environment ] do
  client = Exponent::Push::Client.new

  highlight = Highlight.where.not(sent: true).order(Arel.sql('RANDOM()')).first

  unless highlight
    Highlight.update_all(sent: false)
    highlight = Highlight.order(Arel.sql('RANDOM()')).first
  end

  # highlight.update!(sent: true)

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
