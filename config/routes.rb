Rails.application.routes.draw do
  
  root 'authenticate#index'
  post 'parser/parse', :to => 'parser#parse'
  get 'parser/index', :to => 'parser#index'
  get 'authenticate/logout', :to => 'authenticate#logout'
  
  post 'authenticate/login', :to => 'authenticate#login'
  
end
