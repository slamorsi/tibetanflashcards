class CreateFlashCards < ActiveRecord::Migration
  def change
    create_table :flash_cards do |t|
      t.string :character
      t.string :background
      t.references :original, index: true

      t.timestamps null: false
    end
  end
end
