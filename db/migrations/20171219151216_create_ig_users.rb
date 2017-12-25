Hanami::Model.migration do
  change do
    create_table :ig_users do
      primary_key :id
      
      column :profile_id, Integer, null: false, unique: true
      column :username, String, null: false
      column :image, String, null: false

      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
