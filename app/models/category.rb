class Category < ActiveHash::Base
  @categories = Category.all
  self.data = [
    {id: 0, type: '---'},
    {id: 1, type: 'レディース'},
    {id: 3, type: 'メンズ'},
    {id: 4, type: 'ベビー・キッズ'},
    {id: 5, type: 'インテリア・住まい・小物'},
    {id: 6, type: '本・音楽・ゲーム'},
    {id: 7, type: 'おもちゃ・ホビー・グッズ'},
    {id: 8, type: '家電・スマホ・カメラ'},
    {id: 9, type: 'スポーツ・レジャー'},
    {id: 10, type: 'ハンドメイド'},
    {id: 11, type: 'その他'}
  ]
end