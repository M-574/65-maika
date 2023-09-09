# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
Tag.create([
    { name: 'はじめのひと皿' },
    { name: 'サラダ' },
    { name: 'お肉の前菜' },
    { name: '魚介の前菜' },
    { name: '温前菜' },
    { name: 'メインディッシュ' },
    { name: 'パスタ' },
    { name: 'お酒のお供に' },
    { name: 'デザート' },
])

User.create!(name: "管理者", 
             email: "maika.hirayama.3d@stu.hosei.ac.jp", 
             password: "307254Summer",
             password_confirmation: "307254Summer",
             admin: true)