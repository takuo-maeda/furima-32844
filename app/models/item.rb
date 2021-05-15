class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :delivery_fee_payment
  belongs_to :delivery_prepare
  has_many_attached :images
  belongs_to :user
  has_one :purchase


    with_options presence: true do
      validates :images, :item_name, :description, :category_id, :status_id,
                :prefecture_id, :delivery_fee_payment_id,:delivery_prepare_id,
                :price
    end
    with_options  numericality: { other_than: 1 } do
      validates :category_id,:status_id, :prefecture_id,
                :delivery_fee_payment_id,:delivery_prepare_id
    end

    validates :price, numericality:{ only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
end
