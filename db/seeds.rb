# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  name: 'salone',
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
                         { name: 'その他' }]
                        )
# Stylist.create(
#   stylist_first_name: "フ",
#   stylist_last_name_cana: "リー",
#   stylist_first_name: "フ",
#   stylist_last_name_cana: "リー"　　　　　　　　　　　
# )