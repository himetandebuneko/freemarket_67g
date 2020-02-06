# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# coding: utf-8
Product.create!(id: 1, name: "GU ロングテープベルト", detail: "最高の商品です", size: "S", price: 1000, condition: "新品", shippingaddress: "東京都", shippingdate: "2019-05-01", buyer: "佐藤愛子", seller: "加藤紀子", created_at: "2019-03-01", updated_at: "2019-03-02")
Product.create!(id: 2, name: "minplume リボンまみれワンピース", detail: "オススメです", size: "M", price: 2000, condition: "新品", shippingaddress: "大阪府", shippingdate: "2019-06-01", buyer: "金子浩二", seller: "武田登", created_at: "2019-03-05", updated_at: "2019-03-09")
Product.create!(id: 3, name: "マリクレール時計", detail: "まあまあ", size: "L", price: 5000, condition: "中古", shippingaddress: "秋田県", shippingdate: "2019-06-01", buyer: "秋元達司", seller: "山本武", created_at: "2019-03-01", updated_at: "2019-08-02")
Product.create!(id: 4, name: "bonfantiトートバッグ", detail: "最高", size: "S", price: 20000, condition: "新品", shippingaddress: "北海道", shippingdate: "2019-06-08", buyer: "酒井道", seller: "椎名順", created_at: "2020-03-01", updated_at: "2029-05-01")
Product.create!(id: 5, name: "メンズシャツ", detail: "すごい", size: "L", price: 450, condition: "中古", shippingaddress: "滋賀県", shippingdate: "2017-05-03", buyer: "山田太郎", seller: "八代龍", created_at: "2015-08-14", updated_at: "2015-08-20")
Product.create!(id: 6, name: "ショルダーバッグ", detail: "超絶良い商品です。早い者勝ち", size: "L", price: 2850, condition: "新品", shippingaddress: "沖縄県", shippingdate: "2017-05-03", buyer: "滝本隼人", seller: "宍戸太郎", created_at: "2019-12-07", updated_at: "2020-09-07")
