Uccnrails::Application.routes.draw do 
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  match "/calendar/:year/:month/:day", :as => :calendar_day, :controller => "calendar", :action => "day", :constraints => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}

  match 'events/:id' => 'calendar#event', :as => :calendar_event_detail

  devise_for :users do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end

  match 'about' => 'home#about'
  match 'join' => 'home#join'
  match 'goals' => 'home#goals'
  match 'contact' => 'contact#index'
  match 'contact/create', :via => :post
  match 'contact/success'
  match 'openings' => 'openings#index', :as => 'openings'
  match 'resources' => 'resources#index'
  match 'membership' => 'home#join'
  match 'resources/associations' => 'resources#associations'
  match 'resources/foodprograms' => 'resources#food_programs'
  match 'resources/referrals' => 'resources#referrals'
  match 'blog' => 'blog#index'
  match '/blog/category/:slug' => 'blog#index', :as => :blog_category
  match '/blog/:year/:month/:day/:slug', :as => :blog_post, :controller => "blog", :action => "show", :constraints => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}
  match 'members' => 'members#index', :as => 'user_root'
  match 'profile' => 'members#profile'

  namespace 'members' do
    match 'forum' => 'conversations#index', :via => :get
    match 'forum' => 'conversations#create', :via => :post
    match 'forum/new' => 'conversations#new'
    match 'forum/view/:id/' => 'conversations#show', :as => 'forum_post'
    match 'directory' => 'members#directory'
    match 'officers' => 'members#officers'
    match 'advisory' => 'members#advisory'
    match 'advisoryboard' => 'members#advisory'
    match 'board' => 'members#board'
    resources :documents
  end
 
  match 'admin/' => 'admin#index'
  
  namespace "admin" do
    resources :users
    resources :events
    resources :openings
    resources :posts
    resources :categories
  end
   
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :prducts

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
