json.extract! evaluation, :id, :taster_id, :recipe_id, :grade, :evaluation_date, :comments, :created_at, :updated_at
json.url evaluation_url(evaluation, format: :json)