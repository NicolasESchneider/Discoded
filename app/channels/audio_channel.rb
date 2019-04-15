class AudioChannel < ApplicationCable::Channel
  def subscribed
    stream_from "voice_channel_#{params[:id]}"
  end

  def broadcast(options){
    
    channel_id = options["channelId"]
    type = options["data"]["type"]
    from = options["data"]["from"] || nil
    to = options["data"]["to"] || nil
    sdp = options["data"]["sdp"] || nil
    candidate = options["data"]["candidate"] || nil

    ActionCable.server.broadcast("voice_channel_#{channel_id}",
        type: type,
        from: from,
        to: to,
        sdp: sdp,
        candidate: candidate
      )
  }

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end