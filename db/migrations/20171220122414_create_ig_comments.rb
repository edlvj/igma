Hanami::Model.migration do
  change do
    create_table :ig_comments do
      primary_key :id

      foreign_key :ig_post_id, :ig_posts, null: false
      column :comment_id, String, null: false, unique: true, index: true
      column :profile_username, String, null: false
      column :text, String

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
