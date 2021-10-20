Rails.application.routes.draw do
  get '/top' => "index#top"
  get '/about' => "index#about"
  
end
