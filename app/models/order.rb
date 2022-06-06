class Order
  include ActiveModel::Model
  attr_accessor :post_code, :sipping_area_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id,:token
  
  with_options presence: true do
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)'}
  validates :sipping_area_id, numericality: {other_than: 1, message: "can't be blank"}
  validates :municipalities
  validates :address
  validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/ }
  validates :user_id
  validates :item_id
  validates :token
  end

  def save
    order = PurchaseManagement.create(user_id:user_id, item_id:item_id)
    ShippingAddress.create(post_code:post_code, sipping_area_id:sipping_area_id, municipalities:municipalities, address:address,building:building,phone_number:phone_number)
  end  
  
end