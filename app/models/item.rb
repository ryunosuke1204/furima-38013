class Item < ApplicationRecord

  has_one :purchase_management
belongs_to :user
end
