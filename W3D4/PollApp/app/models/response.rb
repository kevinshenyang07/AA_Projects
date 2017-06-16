# == Schema Information
#
# Table name: responses
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  question_id :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Response < ApplicationRecord

  validates :user_id, presence: true
  validates :question_id, presence: true

  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  has_one :answer_choice,
    through: :question,
    source: :answer_choices


  has_one :question,
    through: :answer_choices,
    source: :questions


  private
  def not_duplicate_response

  end

  def sibling_responses
    question.responses.where(id: self.id)
  end

end
