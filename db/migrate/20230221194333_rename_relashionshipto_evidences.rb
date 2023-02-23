class RenameRelashionshiptoEvidences < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :evidences_id, :evidence_id
  end
end
