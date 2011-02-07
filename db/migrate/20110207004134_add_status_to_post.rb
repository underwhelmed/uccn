class AddStatusToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :status, :int
    Post.all.each do |p|
      p.status = p.published? ? 2 : 1
      p.save!
    end
    remove_column :posts, :published
  end

  def self.down
    add_column :posts, :published, :boolean
    Post.all.each do |p|
      p.status = (p.status == 2) ? true : false
      p.save!
    end
    remove_column :posts, :status
  end
end
