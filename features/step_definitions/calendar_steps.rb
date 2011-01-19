Given /^I have Events with the following attributes:$/ do |table|
  table.hashes.each do |attributes|
    Event.create!(attributes)
  end
end
