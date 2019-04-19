class RoomsController < ApplicationController
  before_action :set_room
  before_action :authenticate

  def show
    messages = Message.includes(:user).where(room_id: @room.id).limit(30)
    render json: messages.to_json(include: :user)
  end

  def post_message

    Message.create(
      user_id: @current_user.id,
      room_id: @room.id,
      body: params[:body]
    )

    render json: @room
  end

  private

  def set_room
    @room = Room.find_or_create_by(video_id: params[:video_id]) do |r|
      r.video_id = params[:video_id]
    end
  end
end
