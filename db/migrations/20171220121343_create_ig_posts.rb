Hanami::Model.migration do
  change do
    create_table :ig_posts do
      primary_key :id

      foreign_key :ig_user_id, :ig_users, null: false

      column :media_id, String, null: false, unique: true, index: true
      column :likes_count, Integer, null: false
      
      column :image_url, String, null: false
      column :text, String, null: true

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
