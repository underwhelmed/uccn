module MembersHelper
  
  def string_to_phone_number(num)
    phone = self.strip_numbers_only(num)
    if !phone.nil? && phone.length == 10
      number_to_phone(phone, :area_code => true)            
    else
      ""
    end    
  end
  
  def strip_numbers_only(value)
    if value.nil? || value.blank?
      nil
    else
      v = value.gsub(/[^0-9]/, '')
      if v.blank?
        nil
      else
        v
      end
    end
  end
  
end
