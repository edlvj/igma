Hanami::Model.migration do
  change do
    create_table :trackings do
      primary_key :id
      foreign_key :user_id, :users, on_delete: :cascade, null: false
      foreign_key :ig_user_id, :ig_users, on_delete: :cascade, null: false

      index [:user_id, :ig_user_id], name: :trackings_index, unique: true
      column :created_at, DateTime, null: false
      column :updated_at, DateTime, null: false
    end
  end
end
