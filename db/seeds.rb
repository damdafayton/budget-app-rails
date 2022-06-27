# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', email: 'fake@fake.com', password:'123456')
second_user = User.create(name: 'Lilly', email: 'fake2@fake.com', password:'he1c314lli')
third_user = User.create(name: 'Markan', email: 'fake3@fake.com', password:'he1c314lli')

first_group = Group.create(name: 'Food' , icon:'Food', author_id: first_user.id)
second_group = Group.create(name: 'Transportation' , icon:'Transportation', author_id: first_user.id)
third_group = Group.create(name: 'Housing' , icon:'Housing', author_id: first_user.id)
fourth_group = Group.create(name: 'Medical' , icon:'Medical', author_id: first_user.id)

first_expenditure = Expenditure.create(name: "Pizza", amount: 4.8, author_id: first_user.id)
second_expenditure = Expenditure.create(name: "Doner", amount: 5.5, author_id: first_user.id)
third_expenditure = Expenditure.create(name: "Cola", amount: 1.2, author_id: first_user.id)
fourth_expenditure = Expenditure.create(name: "Apartment", amount: 40, author_id: first_user.id)
fifth_expenditure = Expenditure.create(name: "Train", amount: 12, author_id: first_user.id)

first_g_e = GroupExpenditure.create(group_id: first_group.id , expenditure_id: first_expenditure.id)
second_g_e = GroupExpenditure.create(group_id: first_group.id , expenditure_id: second_expenditure.id)
third_g_e = GroupExpenditure.create(group_id: first_group.id , expenditure_id: third_expenditure.id)
fourth_g_e = GroupExpenditure.create(group_id: third_group.id , expenditure_id: fourth_expenditure.id)
fifth_g_e = GroupExpenditure.create(group_id: second_group.id , expenditure_id: fifth_expenditure.id)