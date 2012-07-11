class CreateAnswerTables < ActiveRecord::Migration
  def self.up
    create_table :answer_tables do |t|
      t.string :answer
      t.float :rating
      t.references :user_table
      t.references :question_table

      t.timestamps
    end
  end

  def self.down
    drop_table :answer_tables
  end
end
