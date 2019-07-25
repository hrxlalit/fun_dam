Lead::Engine.routes.draw do
    namespace :api do
        namespace :v1 do
          
          resources :leads do
            collection do
              get :get_campaigns
              get :get_countries
              post :get_states
            end
          end
    
        end
      end
end
