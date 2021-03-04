class Status < ActiveHash::Base
  self.data = [
    {id: 0, fee: '---'},
    {id: 1, fee: '新品・未使用'},
    {id: 2, fee: '未使用に近い'},
    {id: 3, fee: '目立った傷や汚れなし'},
    {id: 4, fee: 'やや傷や汚れあり'},
    {id: 5, fee: '傷や汚れあり'},
    {id: 6, fee: '全体的に状態が悪い'}
  ]
end