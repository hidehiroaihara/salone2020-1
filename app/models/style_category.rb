class StyleCategory < ActiveHash::Base
  self.data = [
    { id: 1, name: 'カット' },
    { id: 2, name: 'カラー' },
    { id: 3, name: 'パーマ'},
    { id: 4, name: '縮毛矯正' },
    { id: 5, name: 'エクステ' },
    { id: 6, name: 'トリートメント' },
    { id: 7, name: 'ヘアセット' },
    { id: 8, name: 'ヘッドスパ' },
    { id: 9, name: '着付け' },
    { id: 10, name: 'その他' }
  ]
end
