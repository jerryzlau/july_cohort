class Response < ApplicationRecord
  validates :answer_choice_id, :author_id, presence: true
  validate :not_duplicate_response

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  belongs_to :respondent,
    foreign_key: :author_id,
    class_name: :User

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses - [self]
  end

  def respondent_already_answered?
    sibling_responses.any? {|response| response.author_id == self.author_id}
  end

  def not_duplicate_response
    if respondent_already_answered?
      errors[:respondent] << 'can\t respond to the same question'
    end
  end


end
