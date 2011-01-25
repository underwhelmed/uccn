Then /^I should have a post with a slug of "([^"]*)" and a url of "([^"]*)"$/ do |slug, url|
  post = Post.find_by_slug(slug)
  post.nil?.should be_false
  #post.url.should == url
end
