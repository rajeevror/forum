class CreateQuestionTables < ActiveRecord::Migration
  def self.up
    create_table :question_tables do |t|
      t.string :question

      t.timestamps
    end
  end

  def self.down
    drop_table :question_tables
  end
end
