App.notifier = App.cable.subscriptions.create "NotifierChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log('Subscribed')

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log('Unsubscribed')

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log(data)
    fill_results(data)
