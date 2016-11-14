# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Uf.create(name: "Goiás")
Uf.create(name: "Distrito Federal")
Uf.create(name: "Minas Gerais")
Uf.create(name: "Rio Grande do Sul")
Uf.create(name: "São Paulo")
Uf.create(name: "Rio de Janeiro")

City.create(name: "Luziânia", uf_id: Uf.find_by_name("Goiás").id)
City.create(name: "Brasília", uf_id: Uf.find_by_name("Distrito Federal").id)
City.create(name: "Uberlândia", uf_id: Uf.find_by_name("Minas Gerais").id)
City.create(name: "Porto Alegre", uf_id: Uf.find_by_name("Rio Grande do Sul").id)
City.create(name: "São Paulo", uf_id: Uf.find_by_name("São Paulo").id)
City.create(name: "Rio de Janeiro", uf_id: Uf.find_by_name("Goiás").id)

Category.create(name: "Pratos Quentes")
Category.create(name: "Pratos Frios")
Category.create(name: "Carnes")
Category.create(name: "Massas")
Category.create(name: "Saladas")

Ingredient.create(name: "Picanha", measure: "kg", fabrication_date: Time.new, expire_in: Time.new, description: "Carne")
Ingredient.create(name: "Alface", measure: "kg", fabrication_date: Time.new, expire_in: Time.new, description: "Folhas")
Ingredient.create(name: "Alho", measure: "kg", fabrication_date: Time.new, expire_in: Time.new, description: "Tempero")
Ingredient.create(name: "Frango", measure: "kg", fabrication_date: Time.new, expire_in: Time.new, description: "Carne")
Ingredient.create(name: "Farinha", measure: "colher", fabrication_date: Time.new, expire_in: Time.new, description: "Farinha")
Ingredient.create(name: "Ovo", measure: "unidade", fabrication_date: Time.new, expire_in: Time.new, description: "Ovo")

