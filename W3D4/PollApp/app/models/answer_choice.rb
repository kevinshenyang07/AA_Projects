# == Schema Information
#
# Table name: answer_choices
#
#  id          :integer          not null, primary key
#  question_id :integer          not null
#  body        :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord

  validates :question_id, presence: true, uniqueness: true
  validates :body, presence: true, uniqueness: true

  belongs_to :question,
    primary_key: :id,
    foreign_key: :question_id,
    class_name: :Question

  has_many :responses,
    through: :question,
    source: :responses
end
