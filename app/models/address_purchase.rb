class AddressPurchase
  include ActiveModel::Model
    attr_accessor :postal_code, :prefecture_id, :town, :address, :building, :phone_number, :user_id, :item_id, :purchase_id

    with_options presence: true do
      validates :address 
      validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は登録できませんでした。ハイフン-(半角)を含みます。"}
      validates :town, format: { with: /\A[ぁ-んァ-ン一-龥々]/, message: "は全角ひらがな、全角カタカナ、漢字で入力して下さい" }
      validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "は半角数値で入力して下さい" }
      validates :prefecture_id, numericality: { other_than: 1} 
    end

     def save
       purchase = Purchase.create(user_id: user_id, item_id: item_id)
       Address.create(postal_code: postal_code, prefecture_id: prefecture_id, town: town, address: address, building: building, phone_number: phone_number, purchase_id: purchase.id)
     end
end
