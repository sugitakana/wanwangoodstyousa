# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  email: 'admin@admin',
  password: 'admintest'
)

Customer.create!(
  [
    {name: '太郎', email: 'taro@example.com', password: 'password'},
    {name: '花子', email: 'hanako@example.com', password: 'password'},
    {name: '山田', email: 'yamada@example.com', password: 'password'}
  ] 
)

Tag.create!(
  [
    {name: 'フード・おやつ'},
    {name: 'ベッド'},
    {name: '首輪・ハーネス・リード'},
    {name: 'おもちゃ'},
    {name: '洋服'},
    {name: 'ケア用品'},
    {name: 'その他'}
  ]
)

Review.create!(
  [
    {item_name: 'ワンワンビスケット', item_price: '450', dog_breed: '柴犬', tag_id: 1, review: 'とっても気に入ったようで美味しそうに食べています！', rate: '5', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.JPG"), filename:"sample-post1.JPG"), customer_id: 1},
    {item_name: '水のいらない泡シャンプー', item_price: '600', dog_breed: 'ダックスフンド', tag_id: 6, review: '臭いが気になったので購入しました。いい感じです。', rate: '4', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.JPG"), filename:"sample-post2.JPG"), customer_id: 2},
    {item_name: 'ササミ&野菜ジャーキーフード', item_price: '650', dog_breed: 'トイプードル', tag_id: 1, review: '好きみたいです！', rate: '5', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.JPG"), filename:"sample-post3.JPG"), customer_id: 3},
    {item_name: 'チューイングスティック 超小型犬用', item_price: '440', dog_breed: 'チワワ', tag_id: 1, review: '食後にあげてます。喜んで食べます。', rate: '5', image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.JPG"), filename:"sample-post4.JPG"), customer_id: 1}
  ]
)