class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  has_one_attached :image

    #空の投稿を保存できないようにする
    validates :category_id, presence: true

    #ジャンルの選択が「--」の時は保存できないようにする
    validates :genre_id, numericality: { other_than: 1 } 
end
