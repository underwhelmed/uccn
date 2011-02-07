class AddSlugToCategory < ActiveRecord::Migration
  def self.up
    Category.all().each do |cat|
      cat.slug = cat.create_slug(cat.name)
      cat.save!
    end
  end

  def self.down
     Category.all().each do |cat|
        cat.slug = nil
        cat.save!
      end
  end
end
