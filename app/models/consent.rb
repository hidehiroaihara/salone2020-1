class Consent < ActiveHash::Base
  self.data = [
    { id: 1, name: '配信する' },
    { id: 2, name: '配信しない' }
  ]
end
