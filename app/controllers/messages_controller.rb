# frozen_string_literal: true

# Messages Controller
class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def show
    @message = Message.find_by(id: params[:id])
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.created_at = DateTime.now
    if @message.save
      @message.chat.updated_at = DateTime.now
      @message.chat.save
      redirect_to chats_show_path
      # render chats_show_path
    else
      render 'new', notice: 'Something went wrong'
    end
  end

  def edit
    @message = Message.find_by(id: params[:id])
  end

  def update
    @message = Message.find_by(id: params[:id])
    if @message.update(message_params)
      redirect_to chats_show_path
    else
      render 'edit'
    end
  end

  def destroy
    @message = Message.find_by(id: params[:id])
    @message.destroy

    redirect_to chats_show_path
  end

  private

  def message_params
    params.require(:message).permit(:content, :user_id, :chat_id, :viewed)
  end
end
