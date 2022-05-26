class Item < ApplicationRecord
ActiveHash::Associations::ActiveRecordExtensions

has_one :purchase_management
belongs_to :user
has_one_attached :image

belongs_to :category
belongs_to :item_condition
belongs_to :postage_memu
belongs_to :preparation_day
belongs_to :sipping_area


validates :item_name, presence: true
validates :introduction, presence: true
validates :category_id, presence: true
validates :item_condition_id, presence: true
validates :postage_memu_id, presence: true
validates :preparation_day_id, presence: true
validates :sipping_area_id, presence: true
validates :price, presence: true

end
