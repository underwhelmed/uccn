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