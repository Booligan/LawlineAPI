Rails.application.routes.draw do
  namespace 'api' do
     post 'user_token' => 'user_token#create'

     #GET user products
     resources :users do
      resources :products, only: [:index]
     end 
     
      resources :products do
        #upload products image
        post 'image' => 'products#image'

        #upload product to requesting user
        post 'add' => 'products#add'

        #remove product to requesting user
        post 'remove' => 'products#remove'

        #remove product to requesting user
        delete 'remove' => 'products#remove'
      end

  end
end
