Uccnrails::Application.routes.draw do 
  match '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  match "/calendar/:year/:month/:day", :as => :calendar_day, :controller => "calendar", :action => "day", :constraints => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}

  match 'events/:id' => 'calendar#event', :as => :calendar_event_detail

  devise_for :users do
    get "/login" => "devise/sessions#new"
    get "/logout" => "devise/sessions#destroy"
  end
  
  match 'terms' => 'home#terms_of_use', :as => 'terms'
  match 'privacy' => 'home#privacy_policy', :as => 'privacy'
  match 'about' => 'home#about'
  match 'join' => 'home#join'
  match 'goals' => 'home#goals'
  match 'contact' => 'messages#new'
  match 'contact/create' => 'messages#create', :via => :post
  match 'contact/success' => 'messages#success'
  match 'openings' => 'openings#index', :as => 'openings'
  match 'openings/choosing_a_provider' => 'openings#choosing_a_provider', :as => 'choosing_a_provider'
  match 'resources' => 'resources#index'
  match 'membership' => 'home#join'
  match 'membership/apply' => 'membership#new', :as => 'new_membership'
  match 'membership/create' => 'membership#create', :via => :post, :as => 'memberships'
  match 'membership/success' => 'membership#success', :as => 'membership_success'
  match 'membership/view/' => 'membership#index', :as => 'view_memberships'
  match 'membership/view/:token' => 'membership#view', :as => 'view_membership', :via => :get
  match 'membership/delete/:id' => 'membership#destroy', :as => 'delete_membership', :via => :delete
  match 'resources/associations' => 'resources#associations'
  match 'resources/foodprograms' => 'resources#food_programs'
  match 'resources/referrals' => 'resources#referrals'
  
  match 'gallery' => 'gallery#index', :as => 'gallery'
  match 'gallery/album/:slug/' => 'gallery#view', :as => 'view_gallery_album'
  
  match 'blog' => 'blog#index'
  match 'blog/rss' => 'blog#rss', :as => :blog_rss
  match '/blog/category/:slug' => 'blog#index', :as => :blog_category
  match '/blog/:year/:month/:day/:slug', :as => :blog_post, :controller => "blog", :action => "show", :constraints => {:year => /\d{4}/, :month => /\d{1,2}/, :day => /\d{1,2}/}
  match 'blog/search/(:search)' => 'blog#search', :as => 'blog_search'
  match 'members' => 'members#index', :as => 'user_root'
  match 'profile' => 'members#profile', :via => :get
  match 'profile' => 'members#update_profile', :via => :put
  
  match '/members/directory' => 'members#directory'
  match '/members/officers' => 'members#officers'
  match '/members/advisory' => 'members#advisory'
  match '/members/advisoryboard' => 'members#advisory'
  match '/members/board' => 'members#board'
  match '/members/profiles' => 'members#profiles'
  match '/members/profiles/:id' => 'members#showprofile', :as => 'show_member_profile'
  
  match '/members/downloads' => 'members#downloads'
  match '/members/documents/:id/:filename' => 'members#download', :via => :get

  namespace 'members' do
    match 'forum' => 'conversations#index', :via => :get
    match 'forum' => 'conversations#create', :via => :post
    match 'forum/new' => 'conversations#new'
    match 'forum/view/:id/' => 'conversations#show', :as => 'forum_post'
    match 'forum/reply/:id' => 'conversations#save_reply', :via => :post, :as => 'forum_reply'
    match 'forum/edit/:id/' => 'conversations#edit', :via => :get, :as => 'edit_forum_conversation'
    match 'forum/edit/:id/' => 'conversations#update', :via => :put, :as => 'update_forum_conversation'
    match 'forum/delete/:id' => 'conversations#destroy', :via => :delete, :as => 'delete_forum_post'
    match 'forum/comment/delete/:id' => "conversations#destroy_comment", :via => :delete, :as => 'delete_comment'
  end
 
  match 'admin/' => 'admin#index'
  match 'admin/email' => 'admin#email', :as => 'admin_email'
  match 'admin/send_email' => 'admin#send_email', :via => :post, :as =>'admin_send_email'
  match 'admin/email/success' => 'admin#email_sent'
  
  namespace "admin" do
    resources :users
    resources :events
    resources :event_categories
    resources :openings
    resources :posts
    resources :categories
    resources :documents
    resources :albums
    
    match 'messages' => 'contact#index', :as => 'messages'
    match 'messages/delete/:id' => 'contact#destroy', :via => :delete, :as => 'delete_message'
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
