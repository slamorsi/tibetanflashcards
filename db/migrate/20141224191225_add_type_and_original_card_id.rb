class AddTypeAndOriginalCardId < ActiveRecord::Migration
  def change
    add_reference :flash_cards, :original_card, index: true
    add_column :flash_cards, :type, :string, index: true
  end
end
