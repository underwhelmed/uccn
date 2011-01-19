Given /^I have an Event with the following attributes:$/ do |table|
  table.hashes.each do |attributes|
    Event.create!(attributes)
  end
end
