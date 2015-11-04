class CreatePosts < ActiveRecord::Migration

  def change
    enable_extension 'citext'

    create_table :posts do |t|
      t.jsonb :raw, null: false, default: '{}'

      t.timestamps null: false
    end

    add_index :posts, :raw, using: :gin
  end
end
