class Status < ActiveHash::Base
  self.data = [
    { id: 1, status_id: '--' },
    { id: 2, status_id: '新品・未使用' },
    { id: 3, status_id: '未使用に近い' },
    { id: 4, status_id: '目立った傷・汚れなし' },
    { id: 5, status_id: '傷・汚れなしあり' },
    { id: 6, status_id: '全体的に状態が悪い' }
  ]
 
   include ActiveHash::Associations
   has_many :items
 
  end