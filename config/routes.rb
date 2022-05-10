Rails.application.routes.draw do
  
  defaults format: "json" do

    post 'user_token', to: "user_token#create"
    resources :users
    resources :transactions

   end
end
