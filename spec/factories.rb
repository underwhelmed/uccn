FactoryGirl.define do
  factory :user do
    login "testing"
    first_name "Test"
    last_name "User"
    email  "test_user@example.com"
  end
  
  factory :admin, class: User do
    login "testadmin"
    first_name "Testing"
    last_name "Admin"
    email  "admin_user@example.com"
    admin true
  end  
  
end

