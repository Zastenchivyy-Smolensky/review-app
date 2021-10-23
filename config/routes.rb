Rails.application.routes.draw do
  get 'users/new'
  
  root "index#top"
  get "/help",  to:"index#help"
  get "/about", to:"index#about"
  get "/contact", to:"index#contact"
  get "/signup", to:"users#new"
end
