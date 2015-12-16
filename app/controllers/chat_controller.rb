class ChatController < ApplicationController
  def index
    @messages = Message.lastes
  end
end