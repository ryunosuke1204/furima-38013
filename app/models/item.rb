class Item < ApplicationRecord

has_one :purchase_management
belongs_to :user
has_one_attached :image

validates :item_name, presence: true
validates :introduction, presence: true
validates :category_id, presence: true
validates :item_condition_id, presence: true
validates :postage_memu_id, presence: true
validates :preparation_day_id, presence: true
validates :sipping_area_id, presence: true
validates :price, presence: true

end
