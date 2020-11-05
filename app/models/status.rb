class Status < ActiveHash::Base
  self.data = [
    {id: 1, name: '予約中'},
    {id: 2, name: 'キャンセル'},
    {id: 3, name: '会計済み'}
  ]
end
