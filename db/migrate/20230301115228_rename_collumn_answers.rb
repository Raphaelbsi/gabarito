class RenameCollumnAnswers < ActiveRecord::Migration[7.0]
  def change
    rename_column :answers, :alternatives_id, :alternative_id
  end
end
