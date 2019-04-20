class RoomsController < ApplicationController
  before_action :set_room
  before_action :authenticate

  def show
    messages = Message.includes(:user).where(room_id: @room.id).last(10)
    render json: messages.to_json(include: :user)
  end

  def post_message

    message = Message.includes(:user).create(
      user_id: @current_user.id,
      room_id: @room.id,
      body: params[:body]
    )

    ActionCable.server.broadcast "room_#{@room.video_id}", message.to_json(include: :user)
    head :ok
  end

  private

  def set_room
    @room = Room.find_or_create_by(video_id: params[:video_id]) do |r|
      r.video_id = params[:video_id]
    end
  end
end
