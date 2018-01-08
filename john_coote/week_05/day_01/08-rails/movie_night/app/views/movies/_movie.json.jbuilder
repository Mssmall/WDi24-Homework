json.extract! movie, :id, :title, :netflix, :released, :rating, :description, :created_at, :updated_at
json.url movie_url(movie, format: :json)
