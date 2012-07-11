class AnswerTable < ActiveRecord::Base
  belongs_to :user_table
  belongs_to :question_table
end
