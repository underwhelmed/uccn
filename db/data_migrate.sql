select 
' User.create :id => ' + CAST(u.id as varchar(10)) + 
', :email => "' + CASE WHEN u.emailaddress IS NULL or LEN(RTRIM(u.emailaddress)) = 0 THEN u.loginid + '@uccn.org' ELSE u.emailaddress END + 
'", :password => "' + lower(u.loginid) + 
'123", :password_confirmation => "' + lower(u.loginid) + 
'123", :login => "' + lower(u.loginid) + 
'", :first_name => "' + u.FirstName + 
'", :last_name => "' + u.LastName + 
'", :display_name => ' + CASE WHEN up.DisplayName = (u.FirstName + ' ' + u.LastName) Then 'nil' ELSE '"' + up.DisplayName + '"' END + 
', :business_name => ' + CASE WHEN u.businessName is null or Len(rtrim(u.businessname)) = 0 THEN 'nil' ELSE 
	'"' + REPLACE(u.businessname, '"', '\"') + '"' END + 
', :address1 => ' + CASE WHEN u.address1 is null or Len(rtrim(u.address1)) = 0 THEN 'nil' ELSE '"' + u.address1 + '"' END + 
', :address2 => ' + CASE WHEN u.address2 is null Or Len(rtrim(u.address2)) = 0 THEN 'nil' ELSE '"' + u.address2 + '"' END + 
', :city => '  + CASE WHEN u.city is null Or Len(rtrim(u.city)) = 0 THEN 'nil' ELSE '"' + u.city + '"' END + 
', :state => '  + CASE WHEN u.state is null Or Len(rtrim(u.state)) = 0 THEN 'nil' ELSE '"' + u.state + '"' END + 
', :zip_code => ' + CASE WHEN u.ZIPCode is null Or Len(rtrim(u.ZIPCode)) = 0 THEN 'nil' ELSE '"' + u.ZIPCode + '"' END + 
', :phone_number => '  + CASE WHEN u.phonenumber is null Or Len(rtrim(u.phonenumber)) = 0 THEN 'nil' ELSE '"' + u.phonenumber + '"' END + 
', :cell_number => '  + CASE WHEN u.CellPhoneNumber is null Or Len(rtrim(u.CellPhoneNumber)) = 0 THEN 'nil' ELSE '"' + u.CellPhoneNumber + '"' END + 
', :fax_number => ' + CASE WHEN u.faxnumber is null Or Len(rtrim(u.faxnumber)) = 0 THEN 'nil' ELSE '"' + u.faxnumber + '"' END + 
', :date_of_birth => '  + CASE WHEN u.birthday is null THEN 'nil' ELSE '"' + cast(Month(u.birthday) as varchar(2)) + '/' + cast(day(u.birthday) as varchar(2)) + '/2000"' END + 
', :account_active => ' + CASE WHEN u.IsActive = 1 THEN 'true' ELSE 'false' END +
', :admin => ' + CASE WHEN u.ID in (10000, 10212, 10230, 10255, 10271, 10276) THEN 'true' else 'false' END +
', :created_at => "' + CONVERT(varchar, u.CreateDateTimeUTC, 120) + 
'", :updated_at => "' + Convert(varchar, u.LastUpdatedDateTimeUTC, 120) + 
'", :receive_emails => ' + CASE WHEN up.ReceiveSystemEmails = 1 THEN 'true' ELSE 'false' END + 
', :include_in_directory => ' + CASE WHEN up.IncludeInMemberDirectory = 1 THEN 'true' ELSE 'false' END + 
', :display_address_in_directory => ' + CASE WHEN up.DisplayAddressInDirectory = 1 THEN 'true' ELSE 'false' END + 
', :display_phone_in_directory => ' + CASE WHEN up.DisplayPhoneNumberInDirectory = 1 THEN 'true' ELSE 'false' END + 
', :backup_care => ' + CASE WHEN up.AvailableForBackupCare = 1 THEN 'true' ELSE 'false' END + 
', :biography => ' + CASE WHEN up.MemberBiography IS NULL OR LEN(RTRIM(up.MemberBiography)) = 0 THEN 'nil' ELSE
	'"' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(MemberBiography, '6 months – 6 years.', '6 months to 6 years.'), '…', '...'), ' ', ' '), '’', '\'''), '"', '\"'), '“', '\"'), '”', '\"') + '"' END
FROM [User] u
inner join 
(
	SELECT ID, ReceiveSystemEmails, DisplayName, IncludeInMemberDirectory, DisplayAddressInDirectory,
	DisplayPhoneNumberInDirectory, AvailableForBackupCare, CAST(MemberBiography as VARCHAR(MAX)) as MemberBiography
	FROM Userpreference
) up on u.id = up.id
UNION
select 
'Opening.create! :name => "' + d.providername + 
'", :description => "' + REPLACE(d.notes, '"', '\"') + 
'", :phone => "' + d.phonenumber + 
'", :email => "' + d.emailaddress + 
'", :city => "' + d.cityname +
'", :school_district => "' + d.schooldistrict
+ '",  :created_at => "' + CONVERT(varchar, d.createddateutc, 120)
+ '", :updated_at => "' + CONVERT(varchar, d.lastupdateddateutc, 120) + 
'"'
FROM daycareopening d
UNION
SELECT 
'Category.create! :id => ' + Convert(varchar, id) + ', :name => "' + Description + '"'
FROM BlogCategory
UNION
SELECT 
'Post.create! :title => "' + p.title 
+ '", :published_at => "' + CONVERT(varchar, p.PublishedOn, 120) 
+ '", :body => "' + REPLACE(REPLACE(REPLACE(REPLACE(CONVERT(varchar(Max), p.body), '’', ''''), '''', '\'''), '"', '\"'), ' – ', ' - ') + 
+ '", :author => "' + p.Author + 
+ '", :status => ' + CASE WHEN p.Status = 1 THEN '2' ELSE '1' END 
+ ',  :members_only => ' + CASE WHEN p.ismembersonly = 1 THEN 'true' ELSE 'false' END 
+ ',  :created_at => "' + CONVERT(varchar, p.CreatedOn, 120)
+ '", :updated_at => "' + CONVERT(varchar, p.ModifiedOn, 120) + '"'
from BlogPost p
UNION
select postcats
from 
(SELECT 'post = Post.find_by_slug("' + bp.slug + '"); post.category_ids = [' + 
	STUFF((SELECT ',' + convert(varchar, bpc.blogcategoryid)
			FROM BlogPostCategory bpc 
		   where bpc.blogpostid = bp.id
		  FOR XML PATH('')), 1, 1, '') 
+ ']; post.save!' as postcats
FROM BlogPost bp) b
WHERE postcats is not null
UNION
SELECT
'Conversation.create! :id => ' + Cast(t.id as varchar) +
', :title => "' + REPLACE(t.title, '"', '\"') +
'", :user_id => ' + cast(t.createdbyuserid as varchar) + 
', :views => ' + cast(t.viewcount as varchar) + 
', :created_at => "' + CONVERT(varchar, t.createdDateTime, 120) + 
'", :updated_at => "' + CASE WHEN t.LastUpdatedDateTime is null then CONVERT(varchar, t.createdDateTime, 120) ELSE CONVERT(varchar, t.lastupdateddatetime, 120) END + 
'"' 
FROM [Thread] t
UNION
SELECT
'Comment.create! :user_id => ' + CAST(p.createdbyuserid as varchar) +
', :conversation_id => ' + cast(p.threadid as varchar) + 
', :body => "' + REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(cast(p.body as varchar(max)), '’', '\'''), '“', '"'), '”', '"'), '…', '...'), ' ', ' '), '"', '\"') + 
'", :created_at => "' + Convert(varchar, p.createddatetime, 120) + 
'", :updated_at => "' + CASE WHEN p.lastupdateddatetime is null then Convert(varchar, p.createddatetime, 120) else Convert(varchar, p.lastupdateddatetime, 120) end + '"'
FROM Post p