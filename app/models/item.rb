class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :shipping_payer
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :price, numericality: { greater_than_or_equal_to: 300, 
    less_than_or_equal_to: 9999999 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :item_condition_id
      validates :shipping_payer_id
      validates :preparation_day_id
    end
    validates :prefecture_code_id
    validates :image
  end
end
