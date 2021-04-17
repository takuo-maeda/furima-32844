class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image
  # belongs_to :user

    #空の投稿を保存できないようにする
    with_options presence: true do
      validates :image, :item_name, :description, :category_id,
                :prefecture_id, :delivery_fee_payment_id,:delivery_prepare_id,
                
    end

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :category_id, numericality: { other_than: 1 } 
end
