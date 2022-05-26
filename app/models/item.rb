class Item < ApplicationRecord

has_one :purchase_management
belongs_to :user
has_one_attached :image

validates :column, presence: true

end
