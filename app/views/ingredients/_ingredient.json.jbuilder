json.extract! ingredient, :id, :quantity, :name, :measure, :fabrication_date, :expire_in, :description, :recipe_id, :created_at, :updated_at
json.url ingredient_url(ingredient, format: :json)