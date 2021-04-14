class Genre < ActiveHash::Base
  self.data = [
    { id: 1, category_id: '--' },
    { id: 2, category_id: '経済' },
    { id: 3, category_id: '政治' },
    { id: 4, category_id: '地域' },
    { id: 5, category_id: '国際' },
    { id: 6, category_id: 'IT' },
    { id: 7, category_id: 'エンタメ' },
    { id: 8, category_id: 'スポーツ' },
    { id: 9, category_id: 'グルメ' },
    { id: 10, category_id: 'その他' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end