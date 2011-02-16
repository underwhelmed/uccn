Factory.define :user do |u|
  u.login "testing"
  u.first_name "Test"
  u.last_name "User"
  u.email  "test_user@example.com"
end

Factory.define :admin, :parent => :user do |u|
  u.admin true
end