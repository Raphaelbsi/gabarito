# frozen_string_literal: true

class ScoreCalculator
  prepend SimpleCommand

  def initialize(alternative_id, user_id, evidences_id)
    @alternative_id = alternative_id
    @user_id = user_id
    @evidence_id = evidences_id
  end

  def call
    @evidence = Evidence.find_by(id: @evidence_id)
    @questions = @evidence.questions.count
    corrects = 0
    @evidence.questions.each do |question|
      p correct_alternative = question.alternatives.find_by(correct: true)
      p user_alternative = question.answers.find_by(user_id: @user_id)
      corrects += 1 if user_alternative.alternative_id == correct_alternative.id
    end
    score = (corrects / @questions).to_f * 100.0 if corrects >= 1
    SaveRanking.call(evidence_id, user_id, score)
  end
end
