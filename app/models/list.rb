class List < ApplicationRecord
  #requestor, item, room, quantity
  belongs_to :user, :optional => true

end
