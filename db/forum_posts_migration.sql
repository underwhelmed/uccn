SELECT
'Comment.create! :user_id => ' + CAST(p.createdbyuserid as varchar) +
', :conversation_id => ' + cast(p.threadid as varchar) + 
', :body => "' + REPLACE(cast(p.body as varchar(max)), '"', '\"') + 
'", :created_at => "' + Convert(varchar, p.createddatetime, 120) + 
'", :updated_at => "' + CASE WHEN p.lastupdateddatetime is null then Convert(varchar, p.createddatetime, 120) else Convert(varchar, p.lastupdateddatetime, 120) end + '"'
FROM Post p