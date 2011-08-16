class RemoveNewsletterColumnsFromMembership < ActiveRecord::Migration
  def self.up
    remove_column :memberships, :interest_newsletter
    remove_column :memberships, :newsletter
  end

  def self.down
    add_column :memberships, :interest_newsletter, :boolean
    add_column :memberships, :newsletter, :string
  end
end
