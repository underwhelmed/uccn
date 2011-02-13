SELECT 
'Post.create! :title => "' + p.title 
+ '", :published_at => "' + CONVERT(varchar, p.PublishedOn, 120) 
+ '", :body => "' + REPLACE(REPLACE(REPLACE(CONVERT(varchar(Max), p.body), '’', '\'''), '''', '\'''), '"', '\"') + 
+ '", :author => "' + p.Author + 
+ '", :status => ' + CASE WHEN p.Status = 1 THEN '2' ELSE '1' END 
+ ',  :members_only => ' + CASE WHEN p.ismembersonly = 1 THEN 'true' ELSE 'false' END 
+ ',  :created_at => "' + CONVERT(varchar, p.CreatedOn, 120)
+ '", :updated_at => "' + CONVERT(varchar, p.ModifiedOn, 120) + '"'
from BlogPost p
 
 --t.string   "slug"
 --   t.string   "title",                           :null => false
 --   t.datetime "published_at"
 --   t.string   "excerpt"
 --   t.text     "body"
 --   t.string   "author"
 --   t.boolean  "members_only", :default => false
 --   t.datetime "created_at"
 --   t.datetime "updated_at"
 --   t.integer  "status"