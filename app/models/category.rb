class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'ファッション' },
    { id: 3, name: 'グルメ・飲料' },
    { id: 4, name: '日用品・ヘルスケア' },
    { id: 5, name: 'コスメ・ヘアケア' },
    { id: 6, name: 'ベビー・キッズ' },
    { id: 7, name: '家電' },
    { id: 8, name: 'スポーツ・アウトドア' },
    { id: 9, name: 'エンタメ・ホビー ' },
    { id: 10, name: 'その他' }
  ]
  include ActiveHash::Associations
  has_many :items
  end