class V1::MessagesController < V1::BaseController
  def create
    message = Message.create!(name: params[:name], content: params[:content])
    ActionCable.server.broadcast 'chat', message: message
    render head: :ok
  end
end
