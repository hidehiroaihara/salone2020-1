class StyleType < ActiveHash::Base
  self.data = [
    { id: 1, name: 'ナチュラル' },
    { id: 2, name: 'ビジネス・オフィス' },
    { id: 3, name: 'エレガント'},
    { id: 4, name: '外国人風' },
    { id: 5, name: '韓国風' },
    { id: 6, name: '爽やか' },
    { id: 7, name: 'モード' },
    { id: 8, name: 'フェミニン' },
    { id: 9, name: 'カジュアル' },
    { id: 10, name: 'マニッシュ' }
  ]
end
