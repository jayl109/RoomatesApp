class ListsController < ApplicationController
  def view
  end
  def create
    grocery = List.new(item: params[:name], quantity: params[:quantity])
    grocery.user = current_user
    grocery.save
    current_user.lists << grocery
    current_user.save
    Email.send_list(current_user.email, grocery.item, grocery.quantity)
    redirect_to grocery_list_path
    return
  end
end
