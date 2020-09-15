class Purchase < ApplicationRecord

  belongs_to :user, optional: true 
  belongs_to :item
  has_one :address
end