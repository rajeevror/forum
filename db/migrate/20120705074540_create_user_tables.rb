class CreateUserTables < ActiveRecord::Migration
  def self.up
    create_table :user_tables do |t|
      t.string :user_name
      t.string :email_id
      t.string :password
      t.string :user_type

      t.timestamps
    end
  end

  def self.down
    drop_table :user_tables
  end
end
