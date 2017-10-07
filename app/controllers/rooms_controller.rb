class RoomsController < ApplicationController
  before_action :authenticate_user!
  @text = false
  def setup

  end
  def create

    @id = params[:id]
    if Room.exists?(:id => @id)
      redirect_to setup_path, :flash => { :error => "That room exists" }
      return
    end
    @room = Room.new
    @room.room_number = @id

    @room.save
    current_user.room = @room
    current_user.save
    redirect_to root_url
    return
  end
  def display
    if current_user.room == nil
      redirect_to setup_path
      return
    end
  end
end
