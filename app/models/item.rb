class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  has_one_attached :image
  # belongs_to :user

    #空の投稿を保存できないようにする
    with_options presence: true do
      validates :image, :item_name, :description, :category_id, :status_id,
                :prefecture_id, :delivery_fee_payment_id,:delivery_prepare_id,
                :price
      #ジャンルの選択が「--」の時は保存できないようにする
    end
    with_options  numericality: { other_than: 1 } do
      validates :category_id,:status_id, :prefecture_id,
                :delivery_fee_payment_id,:delivery_prepare_id
    end

    validates :price, numericality:{ only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999999 }
    
    # format: { with: /\A[0-9]+\z/ , message: "は半角数字で入力して下さい"}

end
