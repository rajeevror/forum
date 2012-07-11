class CreateRequesterTables < ActiveRecord::Migration
  def self.up
    create_table :requester_tables do |t|
      t.references :user_table
      t.references :question_table

      t.timestamps
    end
  end

  def self.down
    drop_table :requester_tables
  end
end
