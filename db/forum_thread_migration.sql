SELECT
'Conversation.create! :id => ' + Cast(t.id as varchar) +
', :title => "' + REPLACE(t.title, '"', '\"') +
'", :user_id => ' + cast(t.createdbyuserid as varchar) + 
', :views => ' + cast(t.viewcount as varchar) + 
', :created_at => "' + CONVERT(varchar, t.createdDateTime, 120) + 
'", :updated_at => "' + CASE WHEN t.LastUpdatedDateTime is null then CONVERT(varchar, t.createdDateTime, 120) ELSE CONVERT(varchar, t.lastupdateddatetime, 120) END + 
'"' 
FROM [Thread] t