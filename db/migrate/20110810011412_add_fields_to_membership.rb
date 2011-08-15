class AddFieldsToMembership < ActiveRecord::Migration
  def self.up
     add_column :memberships, :new_member, :boolean
     add_column :memberships, :member_type, :string
     add_column :memberships, :license_type, :string
     add_column :memberships, :interest_newsletter, :boolean
     add_column :memberships, :interest_website, :boolean
     add_column :memberships, :interest_networking, :boolean
     add_column :memberships, :interest_cpr, :boolean
     add_column :memberships, :interest_backup, :boolean
     add_column :memberships, :interest_meetings, :boolean
     add_column :memberships, :interest_field_trips, :boolean
     add_column :memberships, :interest_other, :string
     add_column :memberships, :topic_requests, :string
     add_column :memberships, :publish_address, :boolean
     add_column :memberships, :license_number, :string
     add_column :memberships, :referral_info, :string
     add_column :memberships, :christmas, :string
     add_column :memberships, :manna, :string
     add_column :memberships, :membership, :string
     add_column :memberships, :newsletter, :string
     add_column :memberships, :public_relations, :string
    
  end

  def self.down
    remove_column :memberships, :new_member
    remove_column :memberships, :member_type
    remove_column :memberships, :license_type
    remove_column :memberships, :interest_newsletter
    remove_column :memberships, :interest_website
    remove_column :memberships, :interest_networking
    remove_column :memberships, :interest_cpr
    remove_column :memberships, :interest_backup
    remove_column :memberships, :interest_meetings
    remove_column :memberships, :interest_field_trips
    remove_column :memberships, :interest_other
    remove_column :memberships, :topic_requests
    remove_column :memberships, :publish_address
    remove_column :memberships, :license_number
    remove_column :memberships, :referral_info
    remove_column :memberships, :christmas
    remove_column :memberships, :manna
    remove_column :memberships, :membership
    remove_column :memberships, :newsletter
    remove_column :memberships, :public_relations
  end
end