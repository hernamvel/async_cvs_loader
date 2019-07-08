class NotifierChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notifier_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
