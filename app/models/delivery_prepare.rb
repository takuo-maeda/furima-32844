class DeliveryPrepare < ActiveHash::Base
  self.data = [
    { id: 1, delivery_prepare_id: '--' },
    {id: 2,delivery_prepare_id: '１〜２日で発送'}, {id: 3,delivery_prepare_id: '２〜３日で発送'}, {id: 4,delivery_prepare_id: '４〜７日で発送'}
  ]
   include ActiveHash::Associations
   has_many :items
 
  end