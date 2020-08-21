class Category < ActiveHash::Base
  include ActiveHash::Associations
  self.data = [
    { id: 1, name: 'レディース' },
    { id: 2, name: 'メンズ' },
    { id: 3, name: 'ベビー・キッズ' },
    { id: 4, name: 'インテリア・住まい・小物' },
    { id: 5, name: '本・音楽・ゲーム' },
    { id: 6, name: 'おもちゃ・ホビーグッズ' },
    { id: 7, name: '家電・スマホ・カメラ' },
    { id: 8, name: 'スポーツ・レジャー' },
    { id: 9, name: 'ハンドメイド' },
    { id: 10, name: 'その他' }
  ]
  has_many :items
end
