require 'rails/generators/migration'

class CommentGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    @_acts_as_commentable_source_root ||= File.expand_path("../templates", __FILE__)
  end

  def self.next_migration_number(path)
    Time.now.utc.strftime("%Y%m%d%H%M%S")
  end

  def create_model_file
    template "aac_comment.rb", "app/models/aac_comment.rb"
    migration_template "create_aac_comments.rb", "db/migrate/create_aac_comments.rb"
  end
end
