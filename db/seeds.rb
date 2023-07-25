# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
admin = User.create(email: 'diegoalejandrosilvarodriguez@gmail.com', name: 'Diego Silva', professional_title:'Diseñador', salary_expectation: '500000', skills: 'todas', password: '1985bufalo', role: :admin)
admin = User.create(email: 'estebanrails@gmail.com', name: 'Esteban Rails', professional_title:'Administrador', salary_expectation: '500000', skills: 'todas', password: 'rails123456', role: :admin)

