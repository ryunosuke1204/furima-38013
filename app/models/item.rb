class Item < ApplicationRecord
extend ActiveHash::Associations::ActiveRecordExtensions

belongs_to :category
belongs_to :item_condition
belongs_to :postage_memu
belongs_to :preparation_day
belongs_to :sipping_area

has_one :purchase_management
belongs_to :user
has_one_attached :image

validates :price, numericality: { with: /\A[0-9]+\z/, message: "Half-width number" }
validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

 validates :item_name, presence: true
 validates :introduction, presence: true
# validates :sipping_area_id, numericality: { other_than: 1,message: "can't be blank" } 
# validates :preparation_day, numericality: { other_than: 1,message: "can't be blank" } 
# validates :item_condition_id, numericality: { other_than: 1,message: "can't be blank" } 
# validates :category_id, numericality: { other_than: 1,message: "can't be blank" } 
# validates :postage_memu_id, numericality: { other_than: 1,message: "can't be blank" } 


end
