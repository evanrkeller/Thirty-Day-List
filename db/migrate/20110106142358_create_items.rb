class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.references :user

      t.timestamps
    end

    add_index :items, :user_id
    add_index :items, :created_at

  end

  def self.down
    drop_table :items
  end
end
