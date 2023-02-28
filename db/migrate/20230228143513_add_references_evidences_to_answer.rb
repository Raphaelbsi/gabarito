class AddReferencesEvidencesToAnswer < ActiveRecord::Migration[7.0]
  def change
    add_reference :answers, :evidences, foreign_key: true
  end
end
