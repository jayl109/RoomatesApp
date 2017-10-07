class UsersController < ApplicationController
  def delete_room
    current_user.room = nil
    current_user.save
    redirect_to root_url
  end
end
