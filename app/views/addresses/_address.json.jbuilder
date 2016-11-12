json.extract! address, :id, :street, :number, :complement, :cep, :district_id, :type, :created_at, :updated_at
json.url address_url(address, format: :json)