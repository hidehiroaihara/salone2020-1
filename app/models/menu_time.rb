class MenuTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '30分', sum: 1800 },
    { id: 2, name: '60分', sum: 3600 },
    { id: 3, name: '90分', sum: 5400 },
    { id: 4, name: '120分', sum: 7200 },
    { id: 5, name: '150分', sum: 9000 },
    { id: 6, name: '180分', sum: 10800 },
    { id: 7, name: '210分', sum: 12600 },
    { id: 8, name: '240分', sum: 14400 },
    { id: 9, name: '270分', sum: 16200 },
    { id: 10, name: '300分', sum: 18000 }
  ]
end
