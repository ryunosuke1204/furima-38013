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



validates :item_name, presence: true
validates :introduction, presence: true
validates :category_id, presence: true
validates :item_condition_id, presence: true
validates :postage_memu_id, presence: true
validates :preparation_day_id, presence: true
validates :sipping_area_id, presence: true
validates :price, presence: true
validates :title, :text, presence: true
validates :sipping_area_id, numericality: { other_than: 1,message: "can't be blank" } 
validates :preparation_day, numericality: { other_than: 1,message: "can't be blank" } 
validates :item_condition_id, numericality: { other_than: 1,message: "can't be blank" } 
validates :category_id, numericality: { other_than: 1,message: "can't be blank" } 
validates :postage_memu_id, numericality: { other_than: 1,message: "can't be blank" } 

end
