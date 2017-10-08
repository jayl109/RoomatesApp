class UsersController < ApplicationController
  def logout
    redirect_to destroy_user_session_path
    return
  end
  def delete_room
    @room = current_user.room

    current_user.room = nil
    if (@room.users.size == 1)
      @room.destroy
    else
      @room.users.delete(current_user)
    end
    current_user.save
    redirect_to display_path
  end
end
