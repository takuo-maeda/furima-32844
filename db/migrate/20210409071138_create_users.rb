class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string      :nickname,                     null: false
      t.string      :email,                        null: false
      t.string      :encrypted_passwor,            null: false
      t.string      :first_name,                   nill: false
      t.string      :last_name,                    nill: false
      t.string      :first_name_pronounciation,    nill: false
      t.string      :last_name_pronounciation,     nill: false
      t.date        :birthday,                     nill: false
      t.timestamps
    end
  end
end
