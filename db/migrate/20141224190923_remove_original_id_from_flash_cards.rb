class RemoveOriginalIdFromFlashCards < ActiveRecord::Migration
  def change
    remove_column :flash_cards, :original_id, :integer
  end
end
