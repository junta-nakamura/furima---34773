class Day < ActiveHash::Base
  self.data = [
    {id: 0, days: '---'},
    {id: 1, days: '1~2日で発送'},
    {id: 2, days: '3~4日で発送'},
    {id: 3, days: '4~7日で発送'}
  ]
end