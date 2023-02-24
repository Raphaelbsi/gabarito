class AddReferencesToEvidences < ActiveRecord::Migration[7.0]
  def change
    add_reference :evidences, :question, foreign_key: true
    add_reference :questions, :evidence, foreign_key: true
  end
end
