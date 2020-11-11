# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  salon_name: 'salone',
  email: 'salone@salone.com',
  password: 'salone2020',
  admin: true
)
StyleCategoryList.create([ {name: 'カット'},
                           { name: 'カラー' },
                           { name: 'パーマ'},
                           { name: '縮毛矯正' },
                           { name: 'エクステ' },
                           { name: 'トリートメント' },
                           { name: 'ヘアセット' },
                           { name: 'ヘッドスパ' },
                           { name: '着付け' },
                           { name: 'その他' }
                         ]
                        )
RegularHoliday.create([{name: '日曜日', num: '0'},
                       {name: '月曜日', num: '1'},
                       {name: '火曜日', num: '2'},
                       {name: '水曜日', num: '3'},
                       {name: '木曜日', num: '4'},
                       {name: '金曜日', num: '5'},
                       {name: '土曜日', num: '6'}
                      ]
                     )
