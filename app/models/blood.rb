class Blood < ActiveHash::Base
  self.data = [
    { id: 1, name: 'A型' },
    { id: 2, name: 'B型' },
    { id: 3, name: 'O型' },
    { id: 4, name: 'AB型' }
  ]
end
