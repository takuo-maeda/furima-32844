FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation {password}
    first_name { Gimei.first.kanji }
    last_name { Gimei.last.kanji }
    first_name_prono { Gimei.first.katakana }
    last_name_prono { Gimei.last.katakana }
    birthday { Faker::Date.backward }
    # password_short {Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1) }
    # password_alpha {Faker::Lorem.Alpanameric.alpa(number: 6) }
    # password_number {Faker::Lorem.Number(6) }
  end
end


