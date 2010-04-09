class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.integer :team_id
      t.string :host_url
      t.string :access_path
      t.string :blog_url
      t.string :results_url
      t.string :access_url
      t.string :username
      t.string :password
      t.string :blog_number
      t.integer :results_post_number
      t.string :category

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
