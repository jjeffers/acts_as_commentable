class CreateAACComments < ActiveRecord::Migration
  def self.up
    create_table :aac_comments do |t|
      t.string :title, :limit => 50, :default => "" 
      t.text :comment
      t.references :commentable, :polymorphic => true
      t.references :user
      t.string :role, :default => "comments"
      t.timestamps
    end

    add_index :aac_comments, :commentable_type
    add_index :aac_comments, :commentable_id
    add_index :aac_comments, :user_id
  end

  def self.down
    drop_table :aac_comments
  end
end
