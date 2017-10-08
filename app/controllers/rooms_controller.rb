class RoomsController < ApplicationController
  before_action :authenticate_user!
  @text = false
  def setup
    puts "setup"
  end
  def join
    puts "join"
    @id = params[:id]
    if !Room.exists?(room_number: @id)
      redirect_to setup_path, :flash => { :error => "That room doesn't exist" }
      return
    end
    @room = Room.find_by(room_number = @id)

    @room.users << current_user
    current_user.room = @room
    current_user.save
    redirect_to display_path
    return
  end
  def create
    puts "\n\nhere"
    @id = params[:id]
    if Room.exists?(room_number: @id)
      redirect_to setup_path, :flash => { :error => "That room exists" }
      return
    end
    @room = Room.new
    @room.room_number = @id
    @room.users << current_user
    @room.save
    current_user.room = @room
    current_user.save
    puts "redirecting"
    redirect_to display_path
    return
  end
  def display
    if current_user.room == nil
      redirect_to setup_path
      return
    end
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
  end
end
