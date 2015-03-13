json.array!(@balls) do |ball|
  json.extract! ball, :id, :num
  json.url ball_url(ball, format: :json)
end
