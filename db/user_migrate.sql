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
	'"' + REPLACE(REPLACE(REPLACE(REPLACE(MemberBiography, '’', '\'''), '"', '\"'), '“', '\"'), '”', '\"') + '"' END
FROM [User] u
inner join 
(
	SELECT ID, ReceiveSystemEmails, DisplayName, IncludeInMemberDirectory, DisplayAddressInDirectory,
	DisplayPhoneNumberInDirectory, AvailableForBackupCare, CAST(MemberBiography as VARCHAR(MAX)) as MemberBiography
	FROM Userpreference
) up on u.id = up.id
