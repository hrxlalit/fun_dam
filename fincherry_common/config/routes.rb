Rails.application.routes.draw do
  mount Lead::Engine, at: "/lead"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
