json.extract! movie, :id, :name, :gender, :director, :year, :description, :created_at, :updated_at
json.url movie_url(movie, format: :json)
