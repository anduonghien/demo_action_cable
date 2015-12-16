class V1::MessagesController < V1::BaseController
  def create
    message = Message.create!(name: params[:name], content: params[:content])
    render json: message, status: :ok
  end
end
