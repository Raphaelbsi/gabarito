# frozen_string_literal: true

class SaveRanking
  prepend SimpleCommand

  def initialize(evidences_id, user_id, score)
    @score = score
    @user_id = user_id
    @evidence_id = evidences_id
  end

  def call
    ranking = Ranking.find_by(evidence_id: @evidence_id)
    if ranking
      ranking.update(points: @score)
    else
      newranking = Ranking.new
      newranking.evidences_id = @evidence_id
      newranking.users_id = @user_id
      newranking.points = @score
      newranking.save
    end
  end
end
