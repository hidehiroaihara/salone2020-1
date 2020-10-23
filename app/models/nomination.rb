class Nomination < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択なし' },
    { id: 1, name: '可能' },
    { id: 2, name: '不可' }
  ]
end
