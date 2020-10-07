class Member < ActiveHash::Base
  self.data = [
    { id: 1, name: 'silver会員' },
    { id: 2, name: 'gold会員' },
    { id: 3, name: 'black会員' },
    { id: 4, name: 'special会員' }
  ]
end
