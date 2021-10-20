Rails.application.routes.draw do
  root "index#top"
  get 'index/top'
  get 'index/about'
  get "index/help"
end
