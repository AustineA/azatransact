Rails.application.routes.draw do
  
  defaults format: "json" do

    post 'user_token', to: "user_token#create"
    resources :users

   end
end
